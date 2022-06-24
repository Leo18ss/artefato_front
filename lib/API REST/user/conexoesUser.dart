import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';

var _artefatoURL = 'http://168.138.243.221:8080';

var _userID;

Dio _dio = Dio();

Future<dynamic> getUser(String _email) async {
  var url = '$_artefatoURL/user';
  var responseUser = await _dio.get(url);
  return responseUser.data;
}

Future<dynamic> getUserFollowResource(String _id) async {
  var url = '$_artefatoURL/user/influencers/$_id';
  var responseUser = await _dio.get(url);
  return (responseUser.data);
}

Future<void> removeUserAndAllAssets(String _id) async {
  var url = '$_artefatoURL/user/delete?id=$_id';
  var responseUser = await _dio.delete(url);
  print(responseUser.statusCode);
}

Future<int> userFollow(String _followerId, String _influencerId) async {
  FormData formData;
  formData = new FormData.fromMap(
      {"followerId": _followerId, "influencerId": _influencerId});
  var url = '$_artefatoURL/user/follow';
  var responseRegister = await _dio.post(url, data: formData);

  if (responseRegister.statusCode == 200) {
    return 1;
  } else {
    return 0;
  }
}

Future<int> createNewUser(String _name, String _email, String _pass) async {
  FormData formData;
  formData = new FormData.fromMap({
    "bio": "bio here",
    "email": _email,
    "isCrafter": "true",
    "name": _name,
    "password": _pass,
    "wallet": 0
  });
  var url = '$_artefatoURL/user/new';
  var responseRegister = await _dio.post(url, data: formData);

  if (responseRegister.statusCode == 200) {
    return 1;
  } else {
    return 0;
  }
}

Future<dynamic> postLogin(String _email, String _pass) async {
  var url = '$_artefatoURL/auth';
  var responseLogin =
      await _dio.post(url, data: {"email": _email, "password": _pass});

  if (responseLogin.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('_userID', _userID);
    return 1;
  } else {
    return 0;
  }
}

Future<int> postForgetPass(String _email) async {
  return 1;
}
