// widgets/bottom_nav.dart
import 'package:flutter/material.dart';
import '../screens/main_layout.dart';

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
    final iconSize = 28.0;
    final activeColor = Colors.pink;
    final inactiveColor = Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, 0, selectedIndex, onTap, iconSize, activeColor, inactiveColor),
          _navItem(Icons.search, 1, selectedIndex, onTap, iconSize, activeColor, inactiveColor),
          _navItem(Icons.shopping_bag_outlined, 2, selectedIndex, onTap, iconSize, activeColor, inactiveColor),
          _navItem(Icons.favorite_outline, 3, selectedIndex, onTap, iconSize, activeColor, inactiveColor),
          _navItem(Icons.person_outline, 4, selectedIndex, onTap, iconSize, activeColor, inactiveColor),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    int index,
    int selectedIndex,
    Function(int) onTap,
    double size,
    Color activeColor,
    Color inactiveColor,
  ) {
    bool isActive = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index), // فقط استدعاء callback من MainLayout
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isActive)
            Container(
              height: 3,
              width: 30,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(2),
              ),
            )
          else
            const SizedBox(height: 3, width: 30, child: SizedBox()),
          Icon(
            icon,
            size: size,
            color: isActive ? activeColor : inactiveColor,
          ),
        ],
      ),
    );
  }
}
