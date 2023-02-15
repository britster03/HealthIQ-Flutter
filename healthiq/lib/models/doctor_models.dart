// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:healthiq/const.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<DoctorModel> nearbyDoctors = [
  DoctorModel(
    name: "Raghav Dixit",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/doctor_1.jpg",
  ),
  DoctorModel(
    name: "Ajay Mehra",
    position: "Pediatrician",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/doctor_2.jpg",
  ),
  DoctorModel(
    name: "Lily Dsouza",
    position: "Neurologist",
    averageReview: 2,
    totalReviews: 0,
    profile: "assets/doctor_3.jpg",
  ),
];
