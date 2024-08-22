import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_remote_data_source.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remoteDataSource;

  AccountRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getAccountData() async {
    try {
      final remoteUser = await remoteDataSource.getAccountData();
      return Right(remoteUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
