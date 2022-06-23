import 'dart:convert';
import 'dart:io' as Io;

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

Future<void> getProduct(String _name, String _id) async {
  var url = '$_artefatoURL/product?id=$_id&name=$_name';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.get(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<void> getProductResource(String _id) async {
  var url = '$_artefatoURL/product/:$_id';
  _dio.options.headers = {"Autorization": "Bearer $_userToken"};
  var responseUser = await _dio.get(url,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }));
}

Future<int> createProduct(
    String _isAvaliable,
    String _name,
    String _description,
    String _idCrafter,
    String _imageURL,
    String _price) async {
  FormData formData;
  formData = new FormData.fromMap({
    "isAvailable": true,
    "name": "_name",
    "description": "_description",
    "idCrafter": "_idCrafter",
    "imageURL": ["image_URL"],
    "price": '_price'
  });
  var url = '$_artefatoURL/product';
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

Future<dynamic> purshaseProduct() async {
  var url = '$_artefatoURL/product/purchase';
  var responseRegister = await _dio.post(url, data: {
    "buyerId": "52eeb5f4-43a6-4306-afb0-cb588e0dcd79",
    "productId": "8f0577aa-57a5-4596-9e88-18a76c899214"
  });
  String imageBase64 = responseRegister.data['paymentInfo']['qrbase64'];
  imageBase64 = imageBase64.replaceFirst("data:image/png;base64,", "");
  return imageBase64;
}
