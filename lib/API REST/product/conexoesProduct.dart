import 'package:dio/dio.dart';
import 'dart:async';

var _artefatoURL = 'http://168.138.243.221:8080';

Dio _dio = Dio();

Future<dynamic> getProduct() async {
  var url = '$_artefatoURL/product';
  var responseProduct = await _dio.get(url);
  print(responseProduct.data);
}

Future<dynamic> getProductResource(String _id) async {
  var url = '$_artefatoURL/product/$_id';
  var responseProduct = await _dio.get(url);
  print(responseProduct.data);
}

Future<dynamic> createProduct(String _description, String _idCrafter,
    String _imageURL, String _isAvaliable, String _name, String _price) async {
  FormData formData;
  formData = new FormData.fromMap({
    "description": _description,
    "idCrafter": _idCrafter,
    "imageURL": ["$_imageURL"],
    "isAvailable": _isAvaliable,
    "name": _name,
    "price": _price
  });
  var url = '$_artefatoURL/createProduct';
  var responseRegister = await _dio.post(url, data: formData);

  if (responseRegister.statusCode == 200) {
    return responseRegister.data;
  } else {
    return 0;
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
