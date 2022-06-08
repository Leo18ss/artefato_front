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

var _artefatoURL = 'localhost';

void getValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _userToken = prefs.getString('_userToken');
  _userName = prefs.getString('_userName');
  _lastName = prefs.getString('_lastName');
  _userEmail = prefs.getString('_userEmail');
  _userID = prefs.getInt('_userID');
}

Dio _dio = Dio();

Future<int> postForgetPass(String _email) async {
  var url = '$_artefatoURL/api/auth/forgot_password/send_email';
  var responseForgetPass = await _dio.post(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
      data: {"email": _email});

  if (responseForgetPass.statusCode == 200) {
    return 1;
  } else if (responseForgetPass.statusCode != 200 &&
      responseForgetPass.statusCode != 500) {
    return 0;
  } else {
    return -1;
  }
}

// Future<int> changeImage(dynamic _newImage) async {
//   String finalImage = _newImage.split("/").last;
//   FormData formData = new FormData.fromMap({
//     'file': await MultipartFile.fromFile(_newImage, filename: finalImage),
//   });

//   var url = '$_artefatoURL/api/user/update_image';
//   _dio.options.headers = {
//     "Authorization": "Bearer $_userToken",
//   };
//   var responseChangImage = await _dio.post(url,
//       options: Options(
//           followRedirects: false,
//           validateStatus: (status) {
//             return status < 500;
//           }),
//       data: formData);

//   if (responseChangImage.statusCode == 200) {
//     await listUser();
//     return 1;
//   } else if (responseChangImage.statusCode != 200 &&
//       responseChangImage.statusCode != 500) {
//     return 0;
//   } else {
//     return -1;
//   }
// }

Future<int> postRegister(String _name, String _surname, String _email,
    String _pass, String _avatar, int _companyId) async {
  FormData formData;
  if (_avatar == "images/default-avatar.png") {
    formData = new FormData.fromMap({
      "name": _name,
      "surname": _surname,
      "email": _email,
      "password": _pass,
      "company_id": _companyId,
    });
  } else {
    String finalImage = _avatar.split("/").last;
    formData = new FormData.fromMap({
      "name": _name,
      "surname": _surname,
      "email": _email,
      "password": _pass,
      'file': await MultipartFile.fromFile(_avatar, filename: finalImage),
      "company_id": _companyId,
    });
  }

  var url = '$_artefatoURL/api/user/create/student';
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

Future<String> getName() async => _userName;

Future<List> getIDs() async =>
    [_userID, _classID, _userName, _userImage, _lastName];
