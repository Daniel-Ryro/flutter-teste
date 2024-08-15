import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../utils/constants.dart';

// Instância global do GetIt para gerenciamento de injeção de dependências
final getIt = GetIt.instance;

// Função para configurar e registrar o Dio como cliente HTTP
void setupDioClient() {
  // Registra o Dio como singleton para ser usado em todo o app
  getIt.registerLazySingleton<Dio>(() {
    // Configurações base para o Dio, como a URL base e os headers padrão
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // Define a URL base para todas as requisições
        headers: {
          'Accept': 'application/json', // Define o header padrão para aceitar respostas JSON
        },
      ),
    );
    return dio; // Retorna a instância configurada do Dio
  });
}
