// To parse this JSON data, do
//
//     final oAuthAccessToken = oAuthAccessTokenFromJson(jsonString);

import 'dart:convert';

OAuthAccessToken oAuthAccessTokenFromJson(String str) => OAuthAccessToken.fromJson(json.decode(str));

String oAuthAccessTokenToJson(OAuthAccessToken data) => json.encode(data.toJson());

class OAuthAccessToken {
    String? accessToken;
    String? tokenType;
    String? scope;
    int? expiresIn;
    String? refreshToken;

    OAuthAccessToken({
        this.accessToken,
        this.tokenType,
        this.scope,
        this.expiresIn,
        this.refreshToken,
    });

    factory OAuthAccessToken.fromJson(Map<String, dynamic> json) => OAuthAccessToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        scope: json["scope"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "scope": scope,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
    };
}
