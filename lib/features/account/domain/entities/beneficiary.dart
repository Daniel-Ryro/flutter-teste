class Beneficiary {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  Beneficiary({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
