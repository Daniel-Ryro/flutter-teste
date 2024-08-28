import 'package:guarda_digital_flutter/features/viacep/data/datasources/viacep_remote_data_source.dart';
import 'package:guarda_digital_flutter/features/viacep/domain/repositories/viacep_repository.dart';

import '../models/cep_model.dart';

class ViaCepRepositoryImpl implements ViaCepRepository {
  final ViaCepRemoteDataSource remoteDataSource;

  ViaCepRepositoryImpl(this.remoteDataSource);

  @override
  Future<CepModel> getCepData(String cep) async {
    return await remoteDataSource.fetchCepData(cep);
  }
}
