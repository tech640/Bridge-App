// screens/main_layout.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/search.dart';
import 'package:bridge_app/screens/bag.dart';
import 'package:bridge_app/screens/favorite.dart';
import 'package:bridge_app/screens/myAccount.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';

import 'package:bridge_app/screens/dashboard/admin.dart';
import 'package:bridge_app/screens/dashboard/driver.dart';
import 'package:bridge_app/screens/dashboard/store.dart';

class MainLayout extends StatefulWidget {
  final Widget? child;
  final int initialIndex;
  final bool isInnerPage;
  final VoidCallback? onBack;
  final Map<String, dynamic>? user;

  const MainLayout({
    super.key,
    this.child,
    this.initialIndex = 0,
    this.isInnerPage = false,
    this.onBack,
    this.user,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int selectedIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;

    pages = [
      _buildHome(), // 🔥 أهم سطر
      const SearchPage(),
      BagPage(
        loggedIn: widget.user != null,
        cartItems: [
          {"name": "Sample Item 1", "price": 45.0},
          {"name": "Sample Item 2", "price": 30.0}
        ],
      ),
      const FavoritePage(),
      MyAccountPage(isLoggedIn: widget.user != null),
    ];
  }

  void onTabTapped(int index) {
    if (!widget.isInnerPage) {
      setState(() => selectedIndex = index);
      return;
    }

    if (widget.onBack != null) {
      widget.onBack!();
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainLayout(
          initialIndex: index,
          user: widget.user, // 🔥 مهم
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onTabTapped,
      ),
    );
  }

  // 🔥بتنقل بين الدشبورد بناء على تسجيل الدخول الحل كله هون
  Widget _buildHome() {
    if (widget.user == null) {
      return const HomePage();
    }

    final role = widget.user!["role_id"];

    if (role == 1) return const HomePage();
    if (role == 2) return const StoreDashboard();
    if (role == 3) return const DriverDashboard();
    if (role == 4) return const AdminDashboardPage();

    return const HomePage();
  }
}

// للصفحات الداخلية
class MainLayoutWrapper extends StatelessWidget {
  final Widget child;

  const MainLayoutWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: child,
      isInnerPage: true,
    );
  }
}