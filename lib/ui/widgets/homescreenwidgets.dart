import 'package:fixn_go/constants/app_colors.dart';
import 'package:fixn_go/ui/screens/workerprofile/workerprofile_view.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor = Colors.blue,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  final Map<String, dynamic> worker;
  final VoidCallback? onPressed;

  const WorkerCard({super.key, required this.worker, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// NAME
                Text(
                  worker['fullName'] ?? "Unknown",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                /// PROFESSION + RATING
                Row(
                  children: [
                    Text(
                      worker['profession'] ?? "Worker",
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text("•"),
                    const SizedBox(width: 6),
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 2),
                    Text(
                      "${worker['rating'] ?? 0}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// LOCATION + RATE
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${worker['distance'] ?? 0}km",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 14),

                    Text(
                      "\$${worker['ratePerHour']}/hr",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// VIEW PROFILE BUTTON
                SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 246, 216, 188),
                      foregroundColor: Colors.orange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WorkerProfileView(workerUid: worker['uid']),
                        ),
                      );
                    },
                    child: Text(
                      "View Profile",
                      style: TextStyle(
                        color: Palette.themecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          /// RIGHT IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.network(
              worker['profileImage'] ?? "https://via.placeholder.com/200",
              width: 110,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
