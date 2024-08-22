// lib/features/account/domain/usecases/get_account_data.dart
import 'package:dartz/dartz.dart';
import 'package:guarda_digital_flutter/core/errors/failure.dart';
import 'package:guarda_digital_flutter/core/usecases/usecase.dart'; // Certifique-se de importar a interface UseCase e NoParams

import '../entities/user.dart';
import '../repositories/account_repository.dart';

class GetAccountData implements UseCase<User, NoParams> {
  final AccountRepository repository;

  GetAccountData(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getAccountData();
  }
}
