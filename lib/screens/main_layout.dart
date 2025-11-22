// screens/main_layout.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/search.dart';
import 'package:bridge_app/screens/bag.dart';
import 'package:bridge_app/screens/favorite.dart';  
import 'package:bridge_app/screens/myAccount.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    SearchPage(),
    BagPage(
      loggedIn: true,
      cartItems: [
        // {"name": "Sample Item 1", "price": 45.0},
        // {"name": "Sample Item 2", "price": 30.0}
      ],
    ),
    FavoritePage(),
    MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });
        },
      ),
    );
  }
}
