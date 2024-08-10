// import 'package:dartz/dartz.dart';
// import '../../../../core/errors/failure.dart';
// import '../datasources/auth_remote_data_source.dart';

// class AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;

//   AuthRepository(this.remoteDataSource);

//   Future<Either<Failure, void>> login() async {
//     try {
//       await remoteDataSource.login();
//       return const Right(null);
//     } catch (error) {
//       return Left(ServerFailure('Failed to login: ${error.toString()}'));
//     }
//   }

//   Future<Either<Failure, void>> logout() async {
//     try {
//       await remoteDataSource.logout();
//       return const Right(null);
//     } catch (error) {
//       return Left(ServerFailure('Failed to logout: ${error.toString()}'));
//     }
//   }

//   Future<Either<Failure, String?>> getAccessToken() async {
//     try {
//       final token = await remoteDataSource.getAccessToken();
//       return Right(token);
//     } catch (error) {
//       return Left(ServerFailure('Failed to retrieve access token: ${error.toString()}'));
//     }
//   }
// }
