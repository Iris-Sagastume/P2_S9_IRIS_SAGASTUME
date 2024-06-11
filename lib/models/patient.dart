class Patient {
  String id;
  String name;
  String email;
  String phone;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone, required String photoUrl,
  });

  factory Patient.fromMap(Map<String, dynamic> data, String id) {
    return Patient(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '', photoUrl: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
