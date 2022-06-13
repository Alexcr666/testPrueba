// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    TokenModel({
        this.authToken,
    });

    String authToken;

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        authToken: json["auth_token"] == null ? null : json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "auth_token": authToken == null ? null : authToken,
    };
}
