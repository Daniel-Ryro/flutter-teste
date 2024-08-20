import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/constants.dart';

class ApiService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<void> fetchAccountData() async {
    try {
      // Recupera o token salvo
      String? accessToken = await secureStorage.read(key: 'accessToken');

      if (accessToken == null) {
        throw Exception("Token não encontrado.");
      }

      // Monta os headers da requisição utilizando a URL base da ApiConstants
      final headers = {
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7',
        'Authorization': 'Bearer $accessToken',
        'Connection': 'keep-alive',
        'Origin': ApiConstants.baseUrl,
        'Referer': 'https://app-dev.guardadigital.com.br/',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-site',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 OPR/112.0.0.0',
        'sec-ch-ua': '"Not/A)Brand";v="8", "Chromium";v="126", "Opera GX";v="112"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"Windows"',
      };

      // Faz a requisição utilizando a baseUrl da ApiConstants
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/v1/Account'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print('Dados da conta: ${response.body}');
      } else {
        print('Erro ao buscar dados da conta: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao fazer a requisição: $e');
    }
  }
}
