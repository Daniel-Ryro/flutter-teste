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
    } on ServerException catch (e, stackTrace) {
      // Aqui capturamos detalhes adicionais do erro
      final errorMessage = e.message ?? "Erro desconhecido no servidor";

      print("Erro ao obter dados da conta: $errorMessage");
      print("Stack trace: $stackTrace");

      return Left(ServerFailure(errorMessage));
    } catch (e, stackTrace) {
      // Captura outros tipos de exceções que possam ocorrer
      print("Erro inesperado ao obter dados da conta: $e");
      print("Stack trace: $stackTrace");

      return Left(ServerFailure("Erro inesperado: ${e.toString()}"));
    }
  }
}
