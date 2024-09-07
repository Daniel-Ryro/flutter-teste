import '../../domain/entities/beneficiary.dart';

class BeneficiaryModel extends Beneficiary {
  final int personId;
  final int accountId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String cellPhone;
  final String email;
  final DateTime birthDate;
  final int? statusExecutor;
  final int? proofOfLifeStatus;
  final String? identifier; // Pode ser null
  final String? relationship; // Pode ser null
  final String? nameAccount; // Pode ser null

  BeneficiaryModel({
    required this.personId,
    required this.accountId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.cellPhone,
    required this.email,
    required this.birthDate,
    this.statusExecutor,
    this.proofOfLifeStatus,
    this.identifier,
    this.relationship,
    this.nameAccount,
  }) : super(
          id: personId.toString(),
          name: '$firstName $lastName',
          email: email,
          phoneNumber: cellPhone,
        );

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      personId: json['personId'] ?? 0,
      accountId: json['accountId'] ?? 0,
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'] ?? '',
      cellPhone: json['cellPhone'] ?? '',
      email: json['email'] ?? '',
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : DateTime.now(), // Tratamento para datas
      statusExecutor: json['statusExecutor'] ?? 0,
      proofOfLifeStatus: json['proofOfLifeStatus'] ?? 0,
      identifier: json['identifier'], // Mantido como pode ser null
      relationship: json['relationship'], // Mantido como pode ser null
      nameAccount: json['nameAccount'], // Mantido como pode ser null
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
      'statusExecutor': statusExecutor,
      'proofOfLifeStatus': proofOfLifeStatus,
      'identifier': identifier,
      'relationship': relationship,
      'nameAccount': nameAccount,
    };
  }

  BeneficiaryModel copyWith({
    int? personId,
    int? accountId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? cellPhone,
    String? email,
    DateTime? birthDate,
    int? statusExecutor,
    int? proofOfLifeStatus,
    String? identifier,
    String? relationship,
    String? nameAccount,
  }) {
    return BeneficiaryModel(
      personId: personId ?? this.personId,
      accountId: accountId ?? this.accountId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      cellPhone: cellPhone ?? this.cellPhone,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      statusExecutor: statusExecutor ?? this.statusExecutor,
      proofOfLifeStatus: proofOfLifeStatus ?? this.proofOfLifeStatus,
      identifier: identifier ?? this.identifier,
      relationship: relationship ?? this.relationship,
      nameAccount: nameAccount ?? this.nameAccount,
    );
  }
}
