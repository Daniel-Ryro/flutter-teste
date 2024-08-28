import '../../data/models/cep_model.dart';
import '../repositories/viacep_repository.dart';

class GetCepData {
  final ViaCepRepository repository;

  GetCepData(this.repository);

  Future<CepModel> call(String cep) async {
    return await repository.getCepData(cep);
  }
}
