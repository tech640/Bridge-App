// main.dart
import 'package:flutter/material.dart';
import 'screens/main_layout.dart';
import 'services/storage_service.dart';
import 'screens/sign_in.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: StorageService.getUser(),
        builder: (context, snapshot) {

          // لسا عم يحمل
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // إذا في يوزر مخزن
          if (snapshot.data != null) {
            return MainLayout(user: snapshot.data);
          }

          // إذا مش مسجل
          return const SignInPage();
        },
      ),    );
   }
}
