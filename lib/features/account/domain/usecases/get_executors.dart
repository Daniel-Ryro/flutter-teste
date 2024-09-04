import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/executor.dart';
import '../repositories/account_repository.dart';

class GetExecutors implements UseCase<List<Executor>, NoParams> {
  final AccountRepository repository;

  GetExecutors(this.repository);

  @override
  Future<Either<Failure, List<Executor>>> call(NoParams params) async {
    return await repository.getExecutors();
  }
}
