// import 'package:fixn_go/app/app.locator.dart';
// import 'package:fixn_go/services/worker_profile_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:stacked/stacked.dart';

// class AddProfessionViewMOdel extends BaseViewModel {
//   final _service = locator<WorkerProfileService>();

//   final nameController = TextEditingController();
//   final professionController = TextEditingController();
//   final phoneController = TextEditingController();
//   final rateController = TextEditingController();
//   final experienceController = TextEditingController();
//   final aboutController = TextEditingController();
//   final skillController = TextEditingController();

//   final imageUrlController = TextEditingController();
//   String? profileImageUrl;

//   List<String> skills = [];

//   void setProfileImage(String url) {
//     if (url.isEmpty) return;
//     profileImageUrl = url;
//     notifyListeners();
//   }

//   void addSkill() {
//     final skill = skillController.text.trim();
//     if (skill.isEmpty) return;
//     skills.add(skill);
//     skillController.clear();
//     notifyListeners();
//   }

//   void removeSkill(String skill) {
//     skills.remove(skill);
//     notifyListeners();
//   }

//   /// 🔥 VALIDATION
//   String? validate() {
//     if (profileImageUrl == null || profileImageUrl!.isEmpty) {
//       return "Profile photo is required";
//     }
//     if (nameController.text.trim().isEmpty) {
//       return "Full name is required";
//     }
//     if (professionController.text.trim().isEmpty) {
//       return "Profession is required";
//     }
//     if (phoneController.text.trim().isEmpty) {
//       return "Mobile number is required";
//     }
//     if (rateController.text.trim().isEmpty) {
//       return "Rate per hour is required";
//     }
//     if (experienceController.text.trim().isEmpty) {
//       return "Experience is required";
//     }

//     return null; // ✅ valid
//   }

//   Future<void> saveProfile(BuildContext context) async {
//     final error = validate();
//     if (error != null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(error)));
//       return;
//     }

//     setBusy(true);

//     try {
//       await _service.saveProfile(
//         fullName: nameController.text.trim(),
//         profession: professionController.text.trim(),
//         phone: phoneController.text.trim(),
//         ratePerHour: double.tryParse(rateController.text) ?? 0,
//         experience: int.tryParse(experienceController.text) ?? 0,
//         skills: skills, // optional
//         about: aboutController.text.trim(), // optional
//         profileImageUrl: profileImageUrl!,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Profile saved successfully")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Failed to save profile")));
//     }

//     setBusy(false);
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     professionController.dispose();
//     phoneController.dispose();
//     rateController.dispose();
//     experienceController.dispose();
//     aboutController.dispose();
//     skillController.dispose();
//     imageUrlController.dispose();
//     super.dispose();
//   }
// }

import 'package:fixn_go/app/app.locator.dart';
import 'package:fixn_go/services/worker_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class AddProfessionViewMOdel extends BaseViewModel {
  final _service = locator<WorkerProfileService>();

  final nameController = TextEditingController();
  final professionController = TextEditingController();
  final phoneController = TextEditingController();
  final rateController = TextEditingController();
  final experienceController = TextEditingController();
  final aboutController = TextEditingController();
  final skillController = TextEditingController();
  final imageUrlController = TextEditingController();

  String? profileImageUrl;

  /// 🔴 ERROR MESSAGES
  String? nameError;
  String? professionError;
  String? phoneError;
  String? rateError;
  String? experienceError;
  String? imageError;

  List<String> skills = [];

  /// 📞 Phone validation (10 digits)
  bool _isValidPhone(String phone) {
    return RegExp(r'^[6-9]\d{9}$').hasMatch(phone);
  }

  /// 🔥 VALIDATE ALL FIELDS
  void validate() {
    nameError = nameController.text.trim().isEmpty ? "Name is required" : null;

    professionError = professionController.text.trim().isEmpty
        ? "Profession is required"
        : null;

    phoneError = phoneController.text.trim().isEmpty
        ? "Mobile number is required"
        : !_isValidPhone(phoneController.text.trim())
        ? "Enter a valid 10-digit number"
        : null;

    rateError = rateController.text.trim().isEmpty
        ? "Rate per hour required"
        : null;

    experienceError = experienceController.text.trim().isEmpty
        ? "Experience required"
        : null;

    imageError = profileImageUrl == null ? "Profile photo required" : null;

    notifyListeners();
  }

  /// ✅ FORM STATUS
  bool get isFormValid =>
      nameError == null &&
      professionError == null &&
      phoneError == null &&
      rateError == null &&
      experienceError == null &&
      imageError == null;

  void setProfileImage(String url) {
    if (url.isEmpty) return;
    profileImageUrl = url;
    validate();
  }

  void addSkill() {
    final skill = skillController.text.trim();
    if (skill.isEmpty) return;
    skills.add(skill);
    skillController.clear();
    notifyListeners();
  }

  void removeSkill(String skill) {
    skills.remove(skill);
    notifyListeners();
  }

  Future<void> saveProfile(BuildContext context) async {
    validate();
    if (!isFormValid) return;

    setBusy(true);

    await _service.saveProfile(
      fullName: nameController.text.trim(),
      profession: professionController.text.trim(),
      phone: phoneController.text.trim(),
      ratePerHour: double.tryParse(rateController.text) ?? 0,
      experience: int.tryParse(experienceController.text) ?? 0,
      skills: skills,
      about: aboutController.text.trim(),
      profileImageUrl: profileImageUrl!,
    );

    setBusy(false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile saved successfully")));
  }

  @override
  void dispose() {
    nameController.dispose();
    professionController.dispose();
    phoneController.dispose();
    rateController.dispose();
    experienceController.dispose();
    aboutController.dispose();
    skillController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  final List<String> professions = [
    "Electrician",
    "Plumber",
    "Carpenter",
    "Painter",
    "Mason",
    "Mechanic",
    "Welding",
    "Cleaning",
  ];

  void selectProfession(String value) {
    professionController.text = value;
    validate();
  }
}
