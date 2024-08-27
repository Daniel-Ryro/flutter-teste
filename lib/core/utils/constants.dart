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
  static final String tenantId = dotenv.env['TENANTID']!;

  // Outras Configurações
  static final String translateUrl = dotenv.env['TRANSLATE_URL']!;
  static final String viacepApi = dotenv.env['VIACEP_API']!;
  static final String serproApi = dotenv.env['SERPRO_API']!;
  static final String cookieExpireTime = dotenv.env['COOKIE_EXPIRE_TIME']!;
  static final String cookiePath = dotenv.env['COOKIE_PATH']!;
  static final String securityKey = dotenv.env['SECURITY_KEY']!;
  static final String efiAmbiente = dotenv.env['EFI_AMBIENTE']!;
  static final String efiClientId = dotenv.env['EFI_CLIENT_ID']!;
  static final String efiClientSecret = dotenv.env['EFI_CLIENT_SECRET']!;
  static final String efiAccountId = dotenv.env['EFI_ACCOUNT_ID']!;
  static final String efiUrl = dotenv.env['EFI_URL']!;
}
