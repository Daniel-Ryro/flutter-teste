import '../../domain/entities/executor.dart';

class ExecutorModel extends Executor {
  final int personId;
  final int accountId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String cellPhone;
  final String email;
  final DateTime birthDate;
  final String statusExecutorLabel;
  final String proofOfLifeStatusLabel;

  ExecutorModel({
    required this.personId,
    required this.accountId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.cellPhone,
    required this.email,
    required this.birthDate,
    required this.statusExecutorLabel,
    required this.proofOfLifeStatusLabel,
  }) : super(
          id: personId.toString(),
          name: '$firstName $lastName',
          email: email,
        );

  factory ExecutorModel.fromJson(Map<String, dynamic> json) {
    return ExecutorModel(
      personId: json['personId'],
      accountId: json['accountId'],
      firstName: json['firstName'],
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'],
      cellPhone: json['cellPhone'],
      email: json['email'],
      birthDate: DateTime.parse(json['birthDate']),
      statusExecutorLabel: json['statusExecutorLabel'],
      proofOfLifeStatusLabel: json['proofOfLifeStatusLabel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personId': personId,
      'accountId': accountId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'cellPhone': cellPhone,
      'email': email,
      'birthDate': birthDate.toIso8601String(),
      'statusExecutorLabel': statusExecutorLabel,
      'proofOfLifeStatusLabel': proofOfLifeStatusLabel,
    };
  }

  // Método copyWith para criar uma nova instância com valores atualizados
  ExecutorModel copyWith({
    int? personId,
    int? accountId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? cellPhone,
    String? email,
    DateTime? birthDate,
    String? statusExecutorLabel,
    String? proofOfLifeStatusLabel,
  }) {
    return ExecutorModel(
      personId: personId ?? this.personId,
      accountId: accountId ?? this.accountId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      cellPhone: cellPhone ?? this.cellPhone,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      statusExecutorLabel: statusExecutorLabel ?? this.statusExecutorLabel,
      proofOfLifeStatusLabel:
          proofOfLifeStatusLabel ?? this.proofOfLifeStatusLabel,
    );
  }
}
