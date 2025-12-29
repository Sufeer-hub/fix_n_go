// import 'package:fixn_go/app/app.locator.dart';
// import 'package:fixn_go/services/worker_profile_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:stacked/stacked.dart';

// class WorkerProfileViewModel extends BaseViewModel {
//   final _profileService = locator<WorkerProfileService>();

//   String name = "";
//   String about = "";
//   String phone = "";
//   double rate = 0;
//   int experience = 0;
//   List<String> skills = [];

//   Future<void> loadProfile() async {
//     setBusy(true);

//     try {
//       final data = await _profileService.getProfile();

//       if (data != null) {
//         name = data['fullName'] ?? "";
//         about = data['about'] ?? "";
//         phone = data['phone'] ?? "";
//         rate = double.tryParse(data['ratePerHour'].toString()) ?? 0;
//         experience = int.tryParse(data['experience'].toString()) ?? 0;

//         /// SKILLS (Realtime DB stores as map sometimes)
//         if (data['skills'] is Map) {
//           skills = (data['skills'] as Map).values.cast<String>().toList();
//         } else if (data['skills'] is List) {
//           skills = List<String>.from(data['skills']);
//         }
//       }
//     } catch (e) {
//       debugPrint("Load profile error: $e");
//     }

//     setBusy(false);
//     notifyListeners(); // 🔥 REQUIRED
//   }

// }

// import 'package:fixn_go/app/app.locator.dart';
// import 'package:fixn_go/services/worker_profile_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:stacked/stacked.dart';

// class WorkerProfileViewModel extends BaseViewModel {
//   final _profileService = locator<WorkerProfileService>();

//   final String workerUid;

//   WorkerProfileViewModel({required this.workerUid});

//   String name = "";
//   String about = "";
//   String phone = "";
//   String profession = "";
//   String profileImage = "";

//   double rate = 0;
//   int experience = 0;
//   List<String> skills = [];

//   Future<void> loadProfile() async {
//     setBusy(true);

//     try {
//       final data = await _profileService.getProfileByUid(workerUid);

//       if (data != null) {
//         name = data['fullName'] ?? "";
//         about = data['about'] ?? "";
//         phone = data['phone'] ?? "";
//         profession = data['profession'] ?? "Professional";
//         profileImage =
//             data['profileImage'] ?? "https://via.placeholder.com/150";

//         rate = (data['ratePerHour'] ?? 0).toDouble();
//         experience = (data['experience'] ?? 0).toInt();

//         if (data['skills'] is Map) {
//           skills = (data['skills'] as Map).keys.cast<String>().toList();
//         }
//       }
//     } catch (e) {
//       debugPrint("Load profile error: $e");
//     }

//     setBusy(false);
//     notifyListeners();
//   }
// }

import 'package:url_launcher/url_launcher.dart';
import 'package:fixn_go/app/app.locator.dart';
import 'package:fixn_go/services/worker_profile_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class WorkerProfileViewModel extends BaseViewModel {
  final _profileService = locator<WorkerProfileService>();

  final String workerUid;

  WorkerProfileViewModel({required this.workerUid});

  String name = "";
  String about = "";
  String phone = "";
  String profession = "";
  String profileImage = "";

  double rate = 0;
  int experience = 0;
  List<String> skills = [];

  Future<void> loadProfile() async {
    setBusy(true);

    try {
      final data = await _profileService.getProfileByUid(workerUid);

      if (data != null) {
        name = data['fullName'] ?? "";
        about = data['about'] ?? "";
        phone = data['phone'] ?? ""; // 🔹 worker phone
        profession = data['profession'] ?? "Professional";
        profileImage =
            data['profileImage'] ?? "https://via.placeholder.com/150";

        rate = (data['ratePerHour'] ?? 0).toDouble();
        experience = (data['experience'] ?? 0).toInt();

        if (data['skills'] is Map) {
          skills = (data['skills'] as Map).keys.cast<String>().toList();
        }
      }
    } catch (e) {
      debugPrint("Load profile error: $e");
    }

    setBusy(false);
    notifyListeners();
  }

  Future<void> callWorker() async {
    if (phone.isEmpty) return;

    final Uri uri = Uri.parse('tel:$phone');

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
