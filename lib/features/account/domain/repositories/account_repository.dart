// lib/features/account/domain/repositories/account_repository.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/executor.dart';
import '../entities/user.dart';

abstract class AccountRepository {
  Future<Either<Failure, User>> getAccountData();
  Future<Either<Failure, List<Executor>>> getExecutors();
  Future<Either<Failure, void>> addExecutor(Executor executor);
}
