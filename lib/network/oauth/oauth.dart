import 'dart:convert';
import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

// import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:spotify_flutter/network/oauth/auth_options.dart';
import 'package:url_launcher/url_launcher.dart';

import './resources.dart';

/// This class facilitates OAuth2.0 authorization with the Spotify Web API using the Authorization Code Flow.
///
/// The Authorization Code Flow is a Spotify Web API authentication method that enables a secure way to obtain access tokens
/// for making authorized requests to the Spotify API on behalf of a user.
///
/// For detailed instructions on how to use this class and the Spotify Authorization Code Flow, please refer to the official Spotify documentation:
/// [Spotify Web API Authorization Code Flow](https://developer.spotify.com/documentation/web-api/tutorials/code-flow)
class SpotifyOAuth {
  final String clientId;
  final String clientSecret;
  final int serverPort;

  /// Constructs a new instance of the SpotifyOAuth class.
  ///
  /// [clientId] - The Spotify Web API client ID. You must register your application with Spotify to obtain this ID.
  /// [serverPort] - The port on which the local server will listen for the authorization callback.
  /// [clientSecret] - The client secret associated with your Spotify Web API client ID.
  SpotifyOAuth(this.clientId, this.serverPort, this.clientSecret);

  /// Initializes the SpotifyOAuth instance.
  ///
  /// This method sets up a local HTTP server, generates a random state value, and initiates the authorization process by
  /// launching the Spotify Web API authorization URL in the default web browser.
  void init() async {
    final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_callbackHandler);

    await shelf_io.serve(handler, 'localhost', serverPort);

    await launchAuthorizationUrl();
  }

  /// Handles the authorization callback request.
  ///
  /// This method is responsible for processing the authorization callback from Spotify. It extracts the authorization code
  /// from the URL query parameters and uses it to request an access token.
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

      // Logger().i(options.toJson().toString());

      _getAccessToken(options);

      return Response.ok(OAuth2Resources.callbackHTML, headers: {'Content-Type': 'text/html'});
    } else {
      return Response(404);
    }
  }

  /// Requests an access token from Spotify.
  ///
  /// This method sends a POST request to Spotify's token endpoint to exchange the authorization code for an access token.
  void _getAccessToken(AuthOptions options) async {
    final response = await http.post(
      Uri.parse(options.url),
      body: options.form.toJson(),
      encoding: Encoding.getByName('utf-8'),
      headers: options.headers,
    );

    // Logger().i(response.body);

    var savedUserBox = await Hive.openBox('settings');
    savedUserBox.put('userAuth', response.body);

  }

  /// Generates a random string of the specified length.
  ///
  /// [length] - The length of the random string to generate.
  String generateRandomString(int length) {
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(length, (index) => charset[random.nextInt(charset.length)]).join();
  }


  /// Launches the Spotify Web API authorization URL in the default web browser.
  ///
  /// This method constructs the authorization URL with the required parameters and opens it in the default web browser.
  Future<void> launchAuthorizationUrl() async {
    String state = generateRandomString(16);
    String scope = 'user-read-private user-read-email user-library-read';
    String redirectUri = 'http://localhost:$serverPort/callback';

    final Uri _url = Uri.parse(
      'https://accounts.spotify.com/authorize?response_type=code&client_id=$clientId&scope=$scope&redirect_uri=$redirectUri&state=$state');

    await launchUrl(_url);
  }
}