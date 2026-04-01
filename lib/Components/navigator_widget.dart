import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  final String currentPage;

  const NavigatorWidget({
    Key? key,
    required this.currentPage,
  }) : super(key:key);

  Widget _buildNavButton({required IconData icon, required String label, bool isSelected = false}) {
    Color backgroundClr = isSelected ? Colors.white : Color(0xFFFF6767);
    Color textClr = !isSelected ? Colors.white : Color(0xFFFF6767);

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundClr,
          foregroundColor: textClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        icon: Icon(icon, size: 24),
        label: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Positioned.fill(
            top: 43,
            child: Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 330),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(21, 48, 21, 14),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6767),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8) ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Mykyta Shein",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "shein.mykyta@student.uzhnu.edu.ua",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildNavButton(icon: Icons.dashboard, label: "Dashboard", isSelected: currentPage == "Dashboard"),
                      const SizedBox(height: 8),
                      _buildNavButton(icon: Icons.priority_high, label: "Vital Tasks", isSelected: currentPage == "Vital Tasks"),
                      const SizedBox(height: 8),
                      _buildNavButton(icon: Icons.task, label: "My Task", isSelected: currentPage == "My Task"),
                      const SizedBox(height: 8),
                      _buildNavButton(icon: Icons.list, label: "Task Categories", isSelected: currentPage == "Task Categories"),
                      const SizedBox(height: 8),
                      _buildNavButton(icon: Icons.settings, label: "Settings", isSelected: currentPage == "Settings"),
                      const SizedBox(height: 8),
                      _buildNavButton(icon: Icons.help, label: "Help", isSelected: currentPage == "Help"),
                      Spacer(),
                      _buildNavButton(icon: Icons.logout, label: "Logout"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 330,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 86,
                height: 86,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: const DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/profile_picture.png')
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
