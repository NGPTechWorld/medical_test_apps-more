import 'package:medical_test/data/enums/medical_/medical_pecialization_enume.dart';

class Doctor {
  final int id;
  final MedicalSpecialization specialization;
  final double consultationFee;
  final String bio;

  Doctor({
    required this.id,
    required this.specialization,
    required this.consultationFee,
    required this.bio,
  });

  // Function to convert JSON to Doctor object
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      specialization:
          MedicalSpecialization.values.byName(json['specialization']),
      consultationFee: json['consultation_fee'],
      bio: json['bio'],
    );
  }

  // Function to convert Doctor object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization.name,
      'consultation_fee': consultationFee,
      'bio': bio,
    };
  }
}
