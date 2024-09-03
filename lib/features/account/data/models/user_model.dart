import '../../domain/entities/user.dart';

class UserModel extends User {
  final int accountId;
  final String proofOfLifeExpiry;
  final String firstName;
  final String middleName;
  final String lastName;
  final String cellPhone;
  final String setupExpireDate;
  final bool setupExpire;
  final String identifier;
  final int status;
  final String document;

  UserModel({
    required this.accountId,
    required String name,
    required String email,
    required this.proofOfLifeExpiry,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.cellPhone,
    required this.setupExpireDate,
    required this.setupExpire,
    required this.identifier,
    required this.status,
    required this.document,
  }) : super(id: accountId.toString(), name: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accountId: json['accountId'] as int,
      name: json['name'] ?? '',
      email: json['email'] as String,
      proofOfLifeExpiry: json['proofOfLifeExpiry'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      cellPhone: json['cellPhone'] as String,
      setupExpireDate: json['setupExpireDate'] as String,
      setupExpire: json['setupExpire'] as bool,
      identifier: json['identifier'] as String,
      status: json['status'] as int,
      document: json['document']
          as String, // Novo campo adicionado à fábrica fromJson
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'name': name,
      'email': email,
      'proofOfLifeExpiry': proofOfLifeExpiry,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'cellPhone': cellPhone,
      'setupExpireDate': setupExpireDate,
      'setupExpire': setupExpire,
      'identifier': identifier,
      'status': status,
      'document': document, // Novo campo adicionado ao método toJson
    };
  }
}
