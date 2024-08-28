
import '../../data/datasources/viacep_remote_data_source.dart';
import '../../data/models/cep_model.dart';

abstract class ViaCepRepository {
  Future<CepModel> getCepData(String cep);
}

// Implementação do repositório
class ViaCepRepositoryImpl implements ViaCepRepository {
  final ViaCepRemoteDataSource remoteDataSource;

  ViaCepRepositoryImpl(this.remoteDataSource);

  @override
  Future<CepModel> getCepData(String cep) async {
    return await remoteDataSource.fetchCepData(cep);
  }
}
