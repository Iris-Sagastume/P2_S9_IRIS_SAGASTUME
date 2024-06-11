class Doctor {
  String id;
  String name;
  String specialty;
  bool availability;
  String photoUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.availability,
    required this.photoUrl,
  });

  factory Doctor.fromMap(Map<String, dynamic> data, String id) {
    return Doctor(
      id: id,
      name: data['name'] ?? '',
      specialty: data['specialty'] ?? '',
      availability: data['availability'] ?? false,
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'availability': availability,
      'photoUrl': photoUrl,
    };
  }
}
