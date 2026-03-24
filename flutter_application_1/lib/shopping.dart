import 'package:dio/dio.dart';
import 'package:flutter_application_1/product.dart';

class ApiService {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';
    var response = await dio.get(url);
    List<Product> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((e) => Product.fromJson(e)).toList();
    } else {
      print('loi cai chi do roi');
    }
    return ls;
  }
}

var testMainMuasam = ApiService();
