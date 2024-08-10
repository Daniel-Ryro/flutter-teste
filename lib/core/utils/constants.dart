class ApiConstants {
  // Base URL da API
  static const String baseUrl = 'https://api-dev.guardadigital.com.br';

  // Azure AD B2C Configurações
  static const String clientId = '67d920d6-f735-4306-bfb9-673f66383e65';
  static const String tenantId = '29b2d3d8-ed90-4eea-af73-dde82778b556';
  static const String redirectUri = 'https://app-dev.guardadigital.com.br/';
  static const List<String> scopes = [
    'openid', 
    'profile', 
    'https://guardadigitalb2c.onmicrosoft.com/api/account'
  ];

  static const String issuer = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/v2.0/';
  static const String authorizationEndpoint = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/B2C_1_susi/oauth2/v2.0/authorize';
  static const String tokenEndpoint = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/B2C_1_susi/oauth2/v2.0/token';
}