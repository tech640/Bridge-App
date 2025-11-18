// main.dart
import 'package:flutter/material.dart';
import 'screens/home.dart'; // تأكد إنو اسم الملف صح

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // استدعاء الصفحة الرئيسية
    );
  }
}
