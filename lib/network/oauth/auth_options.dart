import 'dart:convert';

/// Represents the options for making an authorization request.
class AuthOptions {
  final String url;
  final Form form;
  final bool json;
  final Map<String, String> headers;

  /// Constructs an AuthOptions instance.
  ///
  /// [form] - The form data for the authorization request.
  /// [json] - Indicates whether the request should use JSON format (true) or not (false).
  /// [headers] - Headers to be included in the authorization request.
  /// [url] - The URL where the authorization request will be sent.
  AuthOptions(this.form, this.json, this.headers, {required this.url});
  
  /// Converts the AuthOptions object to a JSON representation.
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'form': {
        'code': form.code,
        'redirect_url': form.redirectUri,
        'grant_type': form.grantType
      },
      'headers': headers,
      'json': json
    };
  }
}

/// Represents the form data required for authorization.
class Form {
  final String code; 
  final String redirectUri;
  final String grantType = 'authorization_code';

  /// Constructs a Form instance for authorization data.
  ///
  /// [code] - The authorization code received as part of the authorization process.
  /// [redirectUri] - The URL where the user is redirected after authorization.
  Form({required this.code, required this.redirectUri});

  /// Converts the Form object to a JSON representation.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'redirect_uri': redirectUri,
      'grant_type': grantType
    };
  }
}

/// Encodes the client credentials (client ID and client secret) to Base64.
///
/// This function is used to encode client credentials for HTTP Basic Authentication, as required by some authorization servers.
///
/// [clientId] - The client ID associated with your application.
/// [clientSecret] - The client secret associated with your application.
/// Returns a Base64-encoded string representing the client credentials.
String encodeCredentialsToBase64(String clientId, String clientSecret) {
  final credentials = '$clientId:$clientSecret';
  final bytes = utf8.encode(credentials);
  final base64String = base64Encode(bytes);
  return 'Basic $base64String';
}