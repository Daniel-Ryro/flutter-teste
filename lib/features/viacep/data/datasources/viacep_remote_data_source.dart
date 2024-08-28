// features/viacep/data/datasources/viacep_remote_data_source.dart
import 'package:dio/dio.dart';
import '../models/cep_model.dart';

class ViaCepRemoteDataSource {
  final Dio dio;

  ViaCepRemoteDataSource(this.dio);

  Future<CepModel> fetchCepData(String cep) async {
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.data);
    } else {
      throw Exception('Erro ao buscar dados do CEP');
    }
  }
}
