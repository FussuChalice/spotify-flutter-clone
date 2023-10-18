import 'dart:convert';

class AuthOptions {
  final String url;
  final Form form;
  final bool json;
  final Map<String, String> headers;

  AuthOptions(this.form, this.json, this.headers, {required this.url});
  
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

class Form {
  final String code; 
  final String redirectUri;
  final String grantType = 'authorization_code';

  Form({required this.code, required this.redirectUri});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'redirect_uri': redirectUri,
      'grant_type': grantType
    };
  }
}

String encodeCredentialsToBase64(String clientId, String clientSecret) {
  final credentials = '$clientId:$clientSecret';
  final bytes = utf8.encode(credentials);
  final base64String = base64Encode(bytes);
  return 'Basic $base64String';
}