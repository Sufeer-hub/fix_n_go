import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/ui/screens/addprofession/addprofession_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddProfessionView extends StatelessWidget {
  const AddProfessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddProfessionViewMOdel>.reactive(
      viewModelBuilder: () => AddProfessionViewMOdel(),
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9F9F7),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF9F9F7),
            elevation: 0,
            leading: const BackButton(color: Colors.black),
            title: const Text(
              "Worker Details",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

          body: vm.isBusy
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// PROFILE IMAGE
                      /// PROFILE IMAGE
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                vm.profileImageUrl ??
                                    "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1",
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 4,
                              child: GestureDetector(
                                onTap: () => _showImageDialog(context, vm),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.orange,
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          "Change Profile Photo",
                          style: TextStyle(color: Palette.themecolor),
                        ),
                      ),
                      if (vm.imageError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            vm.imageError!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      _label("Full Name"),
                      _input(
                        controller: vm.nameController,
                        icon: Icons.person,
                        hint: "Mateo Rivera",
                        onChanged: vm.validate,
                        errorText: vm.nameError,
                      ),
                      _label("Profession"),
                      GestureDetector(
                        onTap: () => _showProfessionPicker(context, vm),
                        child: AbsorbPointer(
                          child: _input(
                            controller: vm.professionController,
                            icon: Icons.work,
                            hint: "Select profession",
                            errorText: vm.professionError,
                            onChanged: vm.validate,
                          ),
                        ),
                      ),

                      _label("Contact Number"),
                      _input(
                        controller: vm.phoneController,
                        icon: Icons.phone,
                        hint: "(555) 123-9876",
                        keyboardType: TextInputType.phone,
                        onChanged: vm.validate,
                        errorText: vm.phoneError,
                      ),

                      const SizedBox(height: 16),

                      /// RATE & EXPERIENCE
                      Row(
                        children: [
                          Expanded(
                            child: _input(
                              controller: vm.rateController,
                              icon: Icons.attach_money,
                              hint: "rare/hr",
                              keyboardType: TextInputType.number,
                              onChanged: vm.validate,
                              errorText: vm.rateError,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _input(
                              controller: vm.experienceController,
                              icon: Icons.work_outline,
                              hint: "Experience",
                              keyboardType: TextInputType.number,
                              onChanged: vm.validate,
                              errorText: vm.experienceError,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// SKILLS
                      _label("Skills & Expertise"),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: vm.skills
                            .map(
                              (skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Colors.blue.shade50,
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () => vm.removeSkill(skill),
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: vm.skillController,
                              decoration: InputDecoration(
                                hintText: "Add a skill (e.g. Pipe fitting)",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: vm.addSkill,
                            child: const Text("ADD"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// ABOUT
                      _label("About"),
                      TextField(
                        controller: vm.aboutController,
                        maxLines: 5,
                        maxLength: 500,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Reliable and certified electrician...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// SAVE BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: vm.isFormValid
                                ? Colors.orange
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          onPressed: vm.isFormValid
                              ? () => vm.saveProfile(context)
                              : null,
                          icon: const Icon(Icons.save),
                          label: const Text(
                            "Save Profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  /// ---------------- HELPERS ----------------

  static Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
  );

  static Widget _input({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    String? errorText,
    TextInputType keyboardType = TextInputType.text,
    required VoidCallback onChanged,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (_) => onChanged(),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        errorText: errorText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );

  void _showImageDialog(BuildContext context, AddProfessionViewMOdel vm) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Enter Image URL"),
        content: TextField(
          controller: vm.imageUrlController,
          decoration: const InputDecoration(
            hintText: "https://example.com/image.jpg",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              vm.setProfileImage(vm.imageUrlController.text.trim());
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showProfessionPicker(BuildContext context, AddProfessionViewMOdel vm) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vm.professions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, index) {
          final profession = vm.professions[index];
          return ListTile(
            title: Text(profession),
            onTap: () {
              vm.selectProfession(profession);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
