import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ui_templates/business_logic/models/get_info_of_ip_address_repo_model.dart';
import 'package:ui_templates/core/app_strings.dart';

class GetInfoOfIpAddressRepo {
  Future<GetInfoOfIpRepoModel> getInfo(String ip) async {
    String url = AppStrings.GetInfoOfIpAddressApiUrl(ip);
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = await returnResponse(response);
      return GetInfoOfIpRepoModel.fromJson(responseJson);
    } on SocketException {
      throw Exception('No internet from GetIpAddressRepo in getIpAddress');
    } catch (e) {
      throw Exception('${e.toString()} from GetIpAddressRepo in getIpAddress');
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
