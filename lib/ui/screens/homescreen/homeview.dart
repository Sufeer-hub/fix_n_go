import 'package:fixn_go/ui/screens/homescreen/homeviewmodel.dart';
import 'package:fixn_go/ui/screens/localprofessionals/localprofessional_view.dart';
import 'package:fixn_go/ui/widgets/homescreenwidgets.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (vm) => vm.initialise(),
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Location + Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Current Location",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.blue),
                              SizedBox(width: 4),
                              Text(
                                "Downtown, NY",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ],
                      ),

                      /// 🔹 Profile Avatar (First Letter)
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                        child: Text(
                          vm.avatarLetter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// 🔹 Greeting
                  Text(
                    "Hello, ${vm.userName}! 👋",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "What help do you need today?",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  /// 🔹 Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search plumber, electrician...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.tune, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// 🔹 Categories Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("See all", style: TextStyle(color: Colors.blue)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 Categories Grid
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  LocalProfessionalsView(profession: "plumber"),
                            ),
                          );
                        },
                        child: const CategoryItem(
                          title: "Plumbing",
                          icon: Icons.handyman,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LocalProfessionalsView(
                                profession: "electrician",
                              ),
                            ),
                          );
                        },
                        child: const CategoryItem(
                          title: "Electrical",
                          icon: Icons.flash_on,
                        ),
                      ),
                      const CategoryItem(
                        title: "Cleaning",
                        icon: Icons.cleaning_services,
                      ),
                      InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => LocalPainters(),
                        //     ),
                        //   );
                        // },
                        child: const CategoryItem(
                          title: "Painting",
                          icon: Icons.format_paint,
                        ),
                      ),
                      const CategoryItem(title: "Repair", icon: Icons.build),
                    ],
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
