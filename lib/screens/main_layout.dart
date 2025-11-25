// screens/main_layout.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/search.dart';
import 'package:bridge_app/screens/bag.dart';
import 'package:bridge_app/screens/favorite.dart';  
import 'package:bridge_app/screens/myAccount.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';
class MainLayout extends StatefulWidget {
  final Widget? child;
  final int initialIndex;
  final bool isInnerPage;
  final VoidCallback? onBack;

  const MainLayout({
    super.key,
    this.child,
    this.initialIndex = 0,
    this.isInnerPage = false,
     this.onBack,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int selectedIndex;

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    BagPage(
      loggedIn: true,
      cartItems: [
        {"name": "Sample Item 1", "price": 45.0},
        {"name": "Sample Item 2", "price": 30.0}
      ],
    ),
    const FavoritePage(),
    const MyAccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void onTabTapped(int index) {
    if (!widget.isInnerPage) {
      setState(() => selectedIndex = index);
      return;
    }

    if (widget.onBack != null) {
      widget.onBack!(); // ترجع خطوة لورا
      return;
    }

    // صفحة داخلية → نرجع للصفحة الأساسية المطلوبة
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainLayout(initialIndex: index),
      ),
    );
  }

  @override
  // fallback: لو ما في callback نرجع للصفحة الأساسية
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onTabTapped, // البار يستدعي callback من MainLayout
      ),
    );
  }
}

//للصفحات الداخلية
class MainLayoutWrapper extends StatelessWidget {
  final Widget child;

  const MainLayoutWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: child,
      isInnerPage: true, // نعلم MainLayout أن الصفحة داخلية
    );
  }
}