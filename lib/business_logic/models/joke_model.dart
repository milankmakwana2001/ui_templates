// To parse this JSON data, do
//
//     final jokeModel = jokeModelFromJson(jsonString);

import 'dart:convert';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  String type;
  String setup;
  String punchline;
  int id;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
    type: json["type"],
    setup: json["setup"],
    punchline: json["punchline"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "setup": setup,
    "punchline": punchline,
    "id": id,
  };
}
