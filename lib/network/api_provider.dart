import 'package:digital_card_grader/core/models/card_response.dart';
import 'package:digital_card_grader/core/models/common_response.dart';
import 'package:digital_card_grader/core/models/signup_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import '../core/common/apputills.dart';
import '../core/models/login_response.dart';
import 'api_constants.dart';
import 'base_client.dart';
import 'package:dio/dio.dart' as dio;

class ApiProvider {
  static late BaseClient _baseClient;

  ApiProvider() {
    _baseClient = BaseClient();
    _baseClient.init();
  }

  ///-------------------------------login api  ---------------------------->>>>>
  Future<SignupResponse> loginApi(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.login,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return SignupResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return SignupResponse.fromJson(res?.data);
      }
      return SignupResponse(message: e.toString());
    }
  }

  Future<SignupResponse> signUp(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.signup,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return SignupResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return SignupResponse.fromJson(res?.data);
      }
      return SignupResponse(message: e.toString());
    }
  }


  Future<SignupResponse> otpVerify(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.userOtpVerify,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return SignupResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return SignupResponse.fromJson(res?.data);
      }
      return SignupResponse(message: e.toString());
    }
  }

  Future<SignupResponse> resendOtp(
      Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.resendOtp,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return SignupResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return SignupResponse.fromJson(res?.data);
      }
      return SignupResponse(message: e.toString());
    }
  }

  Future<CommonResponse> forgotPassword(
      Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.forgotPassword,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CardResponse> uploadGrade(
      Map<String, dynamic> body,
      String imagePath,
      ) async {
    Utils.showLoading();
    if (imagePath.isNotEmpty) {
      body['card'] = await getMultipartImage(path: imagePath);
    }
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.uploadAndGrade,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CardResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CardResponse.fromJson(res?.data);
      }
      return CardResponse(message: e.toString());
    }
  }

  Future<CardResponse> addCollection(
      Map<String, dynamic> body,
      String imagePath,
      ) async {
    Utils.showLoading();
    if (imagePath.isNotEmpty) {
      body['imagePath'] = await getMultipartImage(path: imagePath);
    }
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.addCollection,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CardResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CardResponse.fromJson(res?.data);
      }
      return CardResponse(message: e.toString());
    }
  }

  static Future<dio.MultipartFile> getMultipartImage({
    required String path,
  }) async {
    String fileName = path.split('/').last;
    String? mimeType = mime(fileName);
    String? mimee = mimeType?.split('/')[0];
    String? type = mimeType?.split('/')[1];
    return await dio.MultipartFile.fromFile(
      path,
      filename: fileName,
      contentType: MediaType(mimee ?? 'image', type ?? 'jpeg'),
    );
  }
}
