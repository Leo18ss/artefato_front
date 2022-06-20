import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';

var _userToken, _userName, _lastName, _userEmail, _userID;

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

Future<void> getUser(String _email) async {
  var url = '$_artefatoURL/user?email=$_email';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.get(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<void> getUserFollowResource() async {
  var url = '$_artefatoURL/user/influencers/:id';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.get(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<void> getUserResource() async {
  var url = '$_artefatoURL/user/:id';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.get(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<void> removeUserAndAllAssets(String _email) async {
  var url = '$_artefatoURL/user/delete?email=$_email';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.delete(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<int> userFollow(String _followerId, String _influencerId) async {
  FormData formData;
  formData = new FormData.fromMap(
      {"followerId": _followerId, "influencerId": _influencerId});
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

Future<int> createNewUser(String _isCrafter, String _name, String _bio,
    String _email, String _wallet) async {
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

Future<int> postLogin(String _email, String _pass) async {
  // var url = '$_artefatoURL/api/auth/login';
  // var responseLogin = await _dio.post(url,
  //     options: Options(
  //         followRedirects: false,
  //         validateStatus: (status) {
  //           return status! < 500;
  //         }),
  //     data: {"email": _email, "password": _pass});

  // _userToken = await (responseLogin.data)["token"];
  // _userName = await (responseLogin.data)["name"];
  // _lastName = await (responseLogin.data)["surname"];
  // _userEmail = await (responseLogin.data)["email"];
  // _userID = await (responseLogin.data)["id"];

  // if (responseLogin.statusCode == 200) {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('_userToken', _userToken);
  //   prefs.setString('_userName', _userName);
  //   prefs.setString('_lastName', _lastName);
  //   prefs.setString('_userEmail', _userEmail);
  //   prefs.setInt('_userID', _userID);
  //   return 1;
  // } else {
  //   return 0;
  // }
  return 1;
}

Future<int> postForgetPass(String _email) async {

  return 1;
}

