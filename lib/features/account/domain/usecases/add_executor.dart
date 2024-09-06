import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/executor.dart';
import '../repositories/account_repository.dart';

class AddExecutor implements UseCase<void, Executor> {
  final AccountRepository repository;

  AddExecutor(this.repository);

  @override
  Future<Either<Failure, void>> call(Executor executor) async {
    return await repository.addExecutor(executor);
  }
}
