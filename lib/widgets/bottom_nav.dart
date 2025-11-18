// widgets/bottom_nav.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem(0, "logo"),
          navItem(1, "search"),
          navItem(2, "heart"),
          navItem(3, "bag"),
          navItem(4, "user"),
        ],
      ),
    );
  }

  Widget navItem(int index, String iconName) {
    bool active = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (active)
            Container(
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          if (active) const SizedBox(height: 4),

          Image.asset(
            active
                ? "assets/icons/${iconName}Pink.png"
                : "assets/icons/${iconName}.png",
            height: 30,
          ),
        ],
      ),
    );
  }
}
