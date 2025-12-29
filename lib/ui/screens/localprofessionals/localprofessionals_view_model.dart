// import 'package:stacked/stacked.dart';
// import 'package:fixn_go/services/worker_profile_service.dart';
// import 'package:fixn_go/app/app.locator.dart';

// class LocalProfessionalsViewModel extends BaseViewModel {
//   final _service = locator<WorkerProfileService>();

//   List<Map<String, dynamic>> workers = [];

//   Future<void> loadWorkers() async {
//     setBusy(true);
//     workers = await _service.fetchAllWorkers();
//     setBusy(false);
//     notifyListeners();
//   }

//   // void goToView() {
//   //   navigationService.navigateTo(Routes.workerProfileView);
//   // }
// }

import 'package:fixn_go/app/app.locator.dart';
import 'package:fixn_go/services/worker_profile_service.dart';
import 'package:stacked/stacked.dart';

class LocalProfessionalsViewModel extends BaseViewModel {
  final _service = locator<WorkerProfileService>();

  final String profession;

  LocalProfessionalsViewModel({required this.profession});

  List<Map<String, dynamic>> workers = [];

  Future<void> loadWorkers() async {
    setBusy(true);

    workers = await _service.fetchWorkersByProfession(profession);

    setBusy(false);
    notifyListeners();
  }
}
