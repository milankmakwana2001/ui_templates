


import 'dart:convert';
import 'dart:io';

import 'package:ui_templates/business_logic/models/getIpAddressRepoModel.dart';
import 'package:ui_templates/core/app_strings.dart';
import 'package:http/http.dart' as http;

class GetIpAddressRepo{
   String url=AppStrings.GetIpAddressApiUrl;

   Future<GetIpAddressRepoModel> getIpAddress() async{
      dynamic responseJson;
      try {
         final response = await http.get(Uri.parse(url));
         responseJson = await returnResponse(response);
         return GetIpAddressRepoModel.fromJson(responseJson);
      } on SocketException {
         throw Exception(
             'No internet from GetIpAddressRepo in getIpAddress');
      } catch (e) {
         throw Exception(
             '${e.toString()} from GetIpAddressRepo in getIpAddress');
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