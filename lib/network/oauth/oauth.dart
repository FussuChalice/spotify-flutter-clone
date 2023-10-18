import 'dart:convert';
import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:spotify_flutter/network/oauth/auth_options.dart';
import 'package:spotify_flutter/network/oauth/oauth_access_token.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyOAuth {
  final String clientId;
  final String clientSecret;
  final int serverPort;

  SpotifyOAuth(this.clientId, this.serverPort, this.clientSecret);

  void init() async {
    final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_callbackHandler);

    final server = await shelf_io.serve(handler, 'localhost', serverPort);

    await launchAuthorizationUrl();
  }

  Response _callbackHandler(Request request) {
    if (request.url.path == 'callback' && request.method == 'GET') {

      final code = request.url.queryParameters['code'] ?? 'null';
      // final state = request.url.queryParameters['state'] ?? 'null';

      AuthOptions options = AuthOptions(
          Form(code: code, redirectUri: 'http://localhost:$serverPort/callback'), 
          true, 
          {
            'Authorization': encodeCredentialsToBase64(clientId, clientSecret),
            'Content-Type': 'application/x-www-form-urlencoded',
          }, 
          url: 'https://accounts.spotify.com/api/token'
        );

      Logger().i(options.toJson().toString());

      _getAccessToken(options);

      return Response.ok('');
    } else {
      return Response(404);
    }
  }

  void _getAccessToken(AuthOptions options) async {
    final response = await http.post(
      Uri.parse(options.url),
      body: options.form.toJson(),
      encoding: Encoding.getByName('utf-8'),
      headers: options.headers,
    );

    Logger().i(response.body);

    var savedUserBox = await Hive.openBox('settings');
    savedUserBox.put('userAuth', response.body);

  }

  String generateRandomString(int length) {
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(length, (index) => charset[random.nextInt(charset.length)]).join();
  }

  Future<void> launchAuthorizationUrl() async {
    String state = generateRandomString(16);
    String scope = 'user-read-private user-read-email';
    String redirectUri = 'http://localhost:$serverPort/callback';

    final Uri _url = Uri.parse(
      'https://accounts.spotify.com/authorize?response_type=code&client_id=$clientId&scope=$scope&redirect_uri=$redirectUri&state=$state');

    await launchUrl(_url);
  }
}