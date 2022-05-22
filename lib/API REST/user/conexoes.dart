import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';

var _userToken,
    _userName,
    _lastName,
    _userEmail,
    _userID,
    _userImage,
    _classID,
    _emailVerified,
    _companyId;

var _artefatoURL = 'http://168.138.243.221:8080';

void getValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _userToken = prefs.getString('_userToken');
  _userName = prefs.getString('_userName');
  _lastName = prefs.getString('_lastName');
  _userEmail = prefs.getString('_userEmail');
  _userID = prefs.getInt('_userID');
}

Dio _dio = Dio();

Future<int> getUser(String _email) async {
    '$_artefatoURL/user?email=$email';
    _dio.options.headers = {"Autorization" : "Bearer $_userToken"};
    var responseUser = await _dio.get(url, options: Options( followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
}

Future<int> getUserFollowResource() async {
    '$_artefatoURL/user/influencers/:id';
    _dio.options.headers = {"Autorization" : "Bearer $_userToken"};
    var responseUser = await _dio.get(url, options: Options( followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
}

Future<int> getUserResource() async {
    '$_artefatoURL/user/:id';
    _dio.options.headers = {"Autorization" : "Bearer $_userToken"};
    var responseUser = await _dio.get(url, options: Options( followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
}

Future<int> removeUserAndAllAssets(String _email) async {
    '$_artefatoURL/user/delete?email=$email';
    _dio.options.headers = {"Autorization" : "Bearer $_userToken"};
    var responseUser = await _dio.del(url, options: Options( followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
}

Future<int> userFollow(String _followerId, String _influencerId) async {
  FormData formData;
    formData = new FormData.fromMap({
      "followerId": "_followerId",
      "influencerId": _"influencerId"
    });
  var url = '$_artefatoURL/user/follow';
    var responseRegister = await _dio.post(url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
        data: formData);

    if (responseRegister.statusCode == 200) {
      return 1;
    } else if (responseRegister.statusCode != 200 &&
        responseRegister.statusCode != 500) {
      return 0;
    } else {
      return -1;
    }
}

Future<int> createNewUser(String _isCrafter, String _name, String _bio, String _email, String _wallet) async {
  FormData formData;
    formData = new FormData.fromMap({
      "isCrafter": '_isCrafter',
      "name": "_name",
      "bio": "_bio",
      "email": "_email",
      "wallet": "_wallet"
    });
  var url = '$_artefatoURL/user/new';
    var responseRegister = await _dio.post(url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
        data: formData);

    if (responseRegister.statusCode == 200) {
      return 1;
    } else if (responseRegister.statusCode != 200 &&
        responseRegister.statusCode != 500) {
      return 0;
    } else {
      return -1;
    }
}

