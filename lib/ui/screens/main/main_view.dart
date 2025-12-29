import 'package:fixn_go/ui/screens/homescreen/homeview.dart';
import 'package:fixn_go/ui/screens/localprofessionals/localprofessional_view.dart';
import 'package:fixn_go/ui/screens/main/main_view_model.dart';
import 'package:fixn_go/ui/screens/userprofile/userprofile_view.dart';
import 'package:fixn_go/ui/screens/workerprofile/workerprofile_view.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, viewModel, child) {
        final pages = const [
          HomeView(),
          Center(child: Text("no data")),
          Center(child: Text("data")),
          ProfileView(),
        ];

        return Scaffold(
          body: pages[viewModel.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: viewModel.changeTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "Bookings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
