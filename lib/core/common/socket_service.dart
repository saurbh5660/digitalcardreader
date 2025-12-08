import 'dart:async';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../network/api_constants.dart';
import 'apputills.dart';
import 'db_helper.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  IO.Socket? socket;

  final StreamController<List<dynamic>> _userConstantChatStreamController =
  StreamController<List<dynamic>>.broadcast();

  Stream<List<dynamic>> get userConstantChatStream =>
      _userConstantChatStreamController.stream;

  final StreamController<dynamic> _chatMessagesController =
  StreamController<dynamic>.broadcast();

  Stream<dynamic> get chatMessagesStream => _chatMessagesController.stream;

  SocketService._internal() {
    connectToServer();
  }

  void connectToServer() {
    if (socket == null || !socket!.connected) {
      socket = IO.io(ApiConstants.socketUrl, IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNew()
          .build());

      socket?.onConnect((_) {
        print('Connected to socket server');
        connectUser();
      });

      socket?.onDisconnect((_) {
        print('Disconnected from socket server');
      });

      _setupListeners();
    }
  }

  void connectUser() {
    final senderId = DbHelper().getUserModel()?.id.toString();
    if (senderId != null) {
      socket?.emit('connect_user', {'userId': senderId});
      connectUserListener();
    }
  }

  void connectUserListener() {
    socket?.on('connect_user_listener', (data) {
      print('User connected: $data');
    });
  }

  void userConstantList(String senderId) {
    Logger().d(senderId);
    socket?.emit('user_constant_list', {'senderId': senderId});
  }

  void sendMessage(Map<String, dynamic> messageData) {
    socket?.emit('send_message', messageData);
  }

  void getMesssages(Map<String, dynamic> messageData) {
    socket?.emit('users_chat_list', messageData);
  }


  void _setupListeners() {
    socket?.on('user_constant_chat_list', (data) {
      Logger().d("Received user constant chat list: $data");
      final List<dynamic> chatList = data['getdata'] ?? [];
      _userConstantChatStreamController.add(chatList);
    });

    socket?.on('users_chat_list_listener', (data) {
      printPrettyJson(data);
      if (data is Map<String, dynamic> && data['getdata'] is List) {
        final List<dynamic> chatList = data['getdata'];
        _chatMessagesController.add(data);
      } else {
        print("Error: Expected list but got ${data['getdata'].runtimeType}");
      }
    });

    socket?.on('send_message_emit', (data) {
      printPrettyJson(data);
      _chatMessagesController.add(data);
    });

    socket?.on('read_data_status', (data) {
      print('Read/Unread Status: $data');
    });

    socket?.on('delete_message_listener', (data) {
      print('Message Deleted: $data');
    });

    socket?.on('clear_chat_listener', (data) {
      print('Chat Cleared: $data');
    });

    socket?.on('block_user_listener', (data) {
      print('User Blocked: $data');
    });

    socket?.on('disconnect_listener', (data) {
      print('User Disconnected: $data');
    });
  }

  void disconnectSocket() {
    socket?.disconnect();
  }

  void dispose() {
    _userConstantChatStreamController.close();
    disconnectSocket();
  }
}
