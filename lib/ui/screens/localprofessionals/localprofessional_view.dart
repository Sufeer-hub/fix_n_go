import 'package:fixn_go/ui/screens/localprofessionals/localprofessionals_view_model.dart';
import 'package:fixn_go/ui/widgets/homescreenwidgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LocalProfessionalsView extends StatelessWidget {
  final String profession;

  const LocalProfessionalsView({super.key, required this.profession});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocalProfessionalsViewModel>.reactive(
      viewModelBuilder: () =>
          LocalProfessionalsViewModel(profession: profession),
      onViewModelReady: (vm) => vm.loadWorkers(),
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7),
          appBar: AppBar(
            title: Text("$profession Professionals"),
            centerTitle: true,
          ),
          body: vm.isBusy
              ? const Center(child: CircularProgressIndicator())
              : vm.workers.isEmpty
              ? const Center(child: Text("No professionals found"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vm.workers.length,
                  itemBuilder: (context, index) {
                    return WorkerCard(worker: vm.workers[index]);
                  },
                ),
        );
      },
    );
  }
}
