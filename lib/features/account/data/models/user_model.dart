import '../../domain/entities/user.dart';

class UserModel extends User {
  final int accountId;
  final String name;
  final String email;
  final String proofOfLifeExpiry;
  final String firstName;
  final String middleName;
  final String lastName;
  final String cellPhone;
  final String setupExpireDate;
  final bool setupExpire;
  final String identifier;
  final int status;

  UserModel({
    required this.accountId,
    required this.name,
    required this.email,
    required this.proofOfLifeExpiry,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.cellPhone,
    required this.setupExpireDate,
    required this.setupExpire,
    required this.identifier,
    required this.status,
  }) : super(id: accountId.toString(), name: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accountId: json['accountId'] as int,  // Assegure que é do tipo int
      name: json['name'] ?? '',  // Se 'name' puder ser null, atribua uma string vazia
      email: json['email'] as String,  // Assegure que é do tipo String
      proofOfLifeExpiry: json['proofOfLifeExpiry'] as String,  // Assegure que é do tipo String
      firstName: json['firstName'] as String,  // Assegure que é do tipo String
      middleName: json['middleName'] as String,  // Assegure que é do tipo String
      lastName: json['lastName'] as String,  // Assegure que é do tipo String
      cellPhone: json['cellPhone'] as String,  // Assegure que é do tipo String
      setupExpireDate: json['setupExpireDate'] as String,  // Assegure que é do tipo String
      setupExpire: json['setupExpire'] as bool,  // Assegure que é do tipo bool
      identifier: json['identifier'] as String,  // Assegure que é do tipo String
      status: json['status'] as int,  // Assegure que é do tipo int
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
    };
  }
}
