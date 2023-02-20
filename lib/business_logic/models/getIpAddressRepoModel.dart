// To parse this JSON data, do
//
//     final getIpAddressRepo = getIpAddressRepoFromJson(jsonString);

import 'dart:convert';

GetIpAddressRepoModel getIpAddressRepoFromJson(String str) => GetIpAddressRepoModel.fromJson(json.decode(str));

String getIpAddressRepoToJson(GetIpAddressRepoModel data) => json.encode(data.toJson());

class GetIpAddressRepoModel {
  GetIpAddressRepoModel({
    required this.ip,
  });

  String ip;

  factory GetIpAddressRepoModel.fromJson(Map<String, dynamic> json) => GetIpAddressRepoModel(
    ip: json["ip"],
  );

  Map<String, dynamic> toJson() => {
    "ip": ip,
  };
}
