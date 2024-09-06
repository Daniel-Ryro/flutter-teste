class Executor {
  final String id;
  final String name;
  final String email;

  Executor({
    required this.id,
    required this.name,
    required this.email,
  });

  // Método toJson para converter o objeto em um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
