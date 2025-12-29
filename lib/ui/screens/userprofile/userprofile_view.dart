import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/ui/screens/userprofile/userprofile_view_model.dart';
import 'package:fixn_go/ui/widgets/profiletile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),

          /// APP BAR
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

          /// BODY
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// PROFILE AVATAR
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Palette.themecolorlight,
                      child: Text(
                        viewModel.avatarLetter,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Palette.themecolor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Palette.themecolor,
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// NAME
                Text(
                  viewModel.userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                /// EMAIL / PHONE
                if (viewModel.email.isNotEmpty)
                  Text(
                    viewModel.email,
                    style: const TextStyle(color: Colors.grey),
                  ),

                if (viewModel.phone.isNotEmpty)
                  Text(
                    viewModel.phone,
                    style: const TextStyle(color: Colors.grey),
                  ),

                const SizedBox(height: 10),

                /// VERIFIED BADGE
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.themecolorlight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Palette.themecolor, size: 16),
                      SizedBox(width: 6),
                      Text(
                        "Verified Member",
                        style: TextStyle(
                          color: Palette.themecolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// SETTINGS
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => viewModel.onclick(),
                          child: ProfileOptionTile(
                            icon: Icons.work_outline,
                            title: "Are you a Professional?",
                          ),
                        ),
                        ProfileOptionTile(
                          icon: Icons.help_outline,
                          title: "Help & Sopport",
                        ),

                        ProfileOptionTile(
                          icon: Icons.receipt_long_outlined,
                          title: "Terms of service",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// LOGOUT
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => viewModel.logout(context),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  "Version 1.0.2",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
