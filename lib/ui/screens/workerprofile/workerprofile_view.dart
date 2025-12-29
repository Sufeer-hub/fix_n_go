//

import 'package:fixn_go/ui/screens/workerprofile/workerprofile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WorkerProfileView extends StatelessWidget {
  final String workerUid;

  const WorkerProfileView({super.key, required this.workerUid});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkerProfileViewModel>.reactive(
      viewModelBuilder: () => WorkerProfileViewModel(workerUid: workerUid),
      onViewModelReady: (vm) => vm.loadProfile(),
      builder: (context, vm, child) {
        if (vm.isBusy) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (vm.name.isEmpty) {
          return const Scaffold(
            body: Center(child: Text("No profile data found")),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF9F9F7),
            elevation: 0,
            leading: const BackButton(color: Colors.black),
            title: const Text(
              "Worker Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ================= HEADER =================
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(vm.profileImage),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        vm.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        vm.profession,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// ================= STATS =================
                Row(
                  children: [
                    _statCard("\$${vm.rate.toStringAsFixed(0)}/hr", "RATE"),
                    _statCard("${vm.experience} Yrs", "EXP."),
                  ],
                ),

                const SizedBox(height: 24),

                /// ================= ABOUT =================
                const Text(
                  "About",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(vm.about.isEmpty ? "No description" : vm.about),

                const SizedBox(height: 24),

                /// ================= SKILLS =================
                const Text(
                  "Skills & Expertise",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                vm.skills.isEmpty
                    ? const Text("No skills added")
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: vm.skills
                            .map(
                              (skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Colors.blue.shade50,
                              ),
                            )
                            .toList(),
                      ),

                const SizedBox(height: 32),

                /// ================= ACTIONS =================
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.chat),
                        label: const Text("Chat"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: vm.phone.isEmpty ? null : vm.callWorker,
                        icon: const Icon(Icons.call),
                        label: const Text("Call Now"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
