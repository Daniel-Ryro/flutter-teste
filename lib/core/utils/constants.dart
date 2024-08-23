import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseUrl = dotenv.env['BASE_URL']!;
  static final String clientId = dotenv.env['CLIENT_ID']!;
  static final String redirectUri = dotenv.env['REDIRECT_URI']!;
  static final String policyName = dotenv.env['POLICY_NAME']!;
  static final List<String> scopes = dotenv.env['SCOPES']!.split(' ');
  static final String issuer = dotenv.env['ISSUER']!;
  static final String authorizationEndpoint = dotenv.env['AUTHORIZATION_ENDPOINT']!;
  static final String tokenEndpoint = dotenv.env['TOKEN_ENDPOINT']!;
  static final String endSessionEndpoint = dotenv.env['END_SESSION_ENDPOINT']!;
}
