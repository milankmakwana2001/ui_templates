import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ui_templates/business_logic/models/product_model.dart';
import 'package:ui_templates/core/app_strings.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts({required int productCount}) async {
    final String url = AppStrings.GetProductUrl(productCount: productCount);
    try {
      dynamic responseJson;
      final response = await http.get(Uri.parse(url));
      responseJson = await returnResponse(response);
      return productModelFromJson(json.encode(responseJson));
    } on SocketException {
      throw Exception('No internet from ProductRepo in getProducts');
    } catch (e) {
      throw Exception('${e.toString()} from ProductRepo in getProducts');
    }
  }

  returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic returnResponse = await json.decode(response.body);
        return returnResponse;
      case 201:
        dynamic returnResponse = await json.decode(response.body);
        return returnResponse;

      default:
        return Exception('GetIpAddressRepo from returnResponse');
    }
  }
}
