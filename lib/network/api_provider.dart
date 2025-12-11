import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/core/models/card_response.dart';
import 'package:digital_card_grader/core/models/common_response.dart';
import 'package:digital_card_grader/core/models/profile_response.dart';
import 'package:digital_card_grader/core/models/signup_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:mime_type/mime_type.dart';
import '../core/common/apputills.dart';
import '../core/models/collection_response.dart';
import '../core/models/login_response.dart';
import '../core/models/marketplace_response.dart';
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
      String frontPath
      ) async {
    Utils.showLoading();
    if (frontPath.isNotEmpty) {
      body['card'] = await getMultipartImage(path: frontPath);
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
      body['image'] = await getMultipartImage(path: imagePath);
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

  Future<CommonResponse> saveImageData(
      Map<String, dynamic> body
      ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.saveImageData,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      return CommonResponse.fromJson(response);
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CollectionResponse> getCollection(
      Map<String, dynamic> body
      ) async {
    // Utils.showLoading();
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.collectionList}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      // Utils.hideLoading();
      return CollectionResponse.fromJson(response);
    } catch (e) {
      // Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CollectionResponse.fromJson(res?.data);
      }
      return CollectionResponse(message: e.toString());
    }
  }

  Future<CardListResponse> getCardList(
      Map<String, dynamic> body
      ) async {
    // Utils.showLoading();
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.cardList}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      // Utils.hideLoading();
      return CardListResponse.fromJson(response);
    } catch (e) {
      // Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CardListResponse.fromJson(res?.data);
      }
      return CardListResponse(message: e.toString());
    }
  }

  Future<CardListResponse> getCardListWithId(
      Map<String, dynamic> body
      ) async {
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.cardList}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      return CardListResponse.fromJson(response);
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return CardListResponse.fromJson(res?.data);
      }
      return CardListResponse(message: e.toString());
    }
  }

  Future<CommonResponse> addToMarketPlace(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.addToMarketPlace,
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

  Future<MarketplaceResponse> getMarketPlace( Map<String, dynamic> body
      ) async {
    // Utils.showLoading();
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.marketPlaceList}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      return MarketplaceResponse.fromJson(response);
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return MarketplaceResponse.fromJson(res?.data);
      }
      return MarketplaceResponse(message: e.toString());
    }
  }

  Future<MarketplaceResponse> home(Map<String, dynamic> body) async {
    Utils.showLoading();
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.home}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return MarketplaceResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return MarketplaceResponse.fromJson(res?.data);
      }
      return MarketplaceResponse(message: e.toString());
    }
  }


  Future<SignupResponse> updateProfile(
      Map<String, dynamic> body,
      String imagePath,
      ) async {
    Utils.showLoading();
    if (imagePath.isNotEmpty && !(imagePath.startsWith("http"))) {
      body['image'] = await getMultipartImage(path: imagePath);
    }
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.updateProfile,
      requestType: RequestType.patch,
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

  Future<ProfileResponse> getProfile(
      Map<String, dynamic> body
      ) async {
    Utils.showLoading();
    String queryString = Uri(queryParameters: body).query;
    String urlWithParams = "${ApiConstants.getProfile}?$queryString";
    ApiRequest apiRequest = ApiRequest(
      url: urlWithParams,
      requestType: RequestType.get,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return ProfileResponse.fromJson(response);
    } catch (e) {
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return ProfileResponse.fromJson(res?.data);
      }
      return ProfileResponse(message: e.toString());
    }
  }


  Future<CommonResponse> changePassword(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.changePassword,
        requestType: RequestType.post,
        body: body);
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CommonResponse> contactUs(Map<String, dynamic> body) async {
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.contactUs, requestType: RequestType.post, body: body);
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CommonResponse> notificationOnOff(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.notificationOnOff,
        requestType: RequestType.post,
        body: body);
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

  Future<CommonResponse> deleteAccount() async {
    Utils.showLoading();
    Map<String, dynamic> body = {};
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.deleteAccount,
        requestType: RequestType.post,
        body: body);
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CommonResponse> logout() async {
    Utils.showLoading();
    Map<String, dynamic> body = {};
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.logout, requestType: RequestType.post, body: body);
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CommonResponse> packBuy(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
        url: ApiConstants.packBuy,
        requestType: RequestType.post,
        body: body);
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
    }
  }

  Future<CommonResponse> followUnfollow(Map<String, dynamic> body) async {
    Utils.showLoading();
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.followUnfollwUser,
      requestType: RequestType.post,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);
      Utils.hideLoading();
      return CommonResponse.fromJson(response);
    } catch (e, stackTrace) {
      Logger().e("Error: ${e.toString()} \nStackTrace: $stackTrace");
      Utils.hideLoading();
      final res = (e as dynamic).response;
      if (res != null) {
        return CommonResponse.fromJson(res?.data);
      }
      return CommonResponse(message: e.toString());
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
