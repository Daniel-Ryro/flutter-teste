class ApiConstants {
  // Base URL da API
  static const String baseUrl = 'https://api-dev.guardadigital.com.br';

  // Azure AD B2C Configurações
  static const String clientId = '6f93a629-c8b4-4407-9881-a69f1db2d03a'; // ID do cliente registrado no Azure AD B2C
  static const String redirectUri = 'br.com.guardadigital.authapp://oauthredirect'; // URI de redirecionamento registrada no Azure AD B2C

  // Policy de Sign-up/Sign-in
  static const String policyName = 'B2C_1_susi'; // Nome da política de sign-in/sign-up no Azure AD B2C

  // Scopes
  static const List<String> scopes = [
    'openid',
    'profile',
    'https://guardadigitalb2c.onmicrosoft.com/api/account',
    'offline_access', // Para permitir a atualização do token
  ];

  // Endpoints de Autorização e Token
  static const String issuer = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/$policyName/v2.0/';
  static const String authorizationEndpoint = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/$policyName/oauth2/v2.0/authorize';
  static const String tokenEndpoint = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/$policyName/oauth2/v2.0/token';

  // Logout Endpoint
  static const String endSessionEndpoint = 'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/$policyName/oauth2/v2.0/logout';
}
