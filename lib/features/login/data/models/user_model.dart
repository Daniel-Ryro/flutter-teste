
import '../../domain/entities/token.dart';

class UserModel extends User {
  final String? idToken;
  final String? accessToken;
  final String? refreshToken;

  UserModel({
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
  }) : super(
          idToken: idToken,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idToken: json['id_token'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
