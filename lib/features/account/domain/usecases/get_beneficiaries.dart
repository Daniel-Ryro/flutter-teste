// lib/features/account/domain/usecases/get_beneficiaries.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/beneficiary.dart';
import '../repositories/account_repository.dart';

class GetBeneficiaries implements UseCase<List<Beneficiary>, NoParams> {
  final AccountRepository repository;

  GetBeneficiaries(this.repository);

  @override
  Future<Either<Failure, List<Beneficiary>>> call(NoParams params) async {
    return await repository.getBeneficiaries();
  }
}
