import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main_layout.dart';
import '../services/storage_service.dart';
class PasswordPage extends StatefulWidget {
  final String email;

  const PasswordPage({super.key, required this.email});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Email: ${widget.email}"),
            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
  final data = await ApiService.login(
    widget.email,
    passwordController.text,
  );

  if (data != null) {

    // 🔥 BACKEND - تخزين اليوزر والتوكن
    await StorageService.saveUser(data["user"]);
    await StorageService.saveTokens(
      data["accessToken"],
      data["refreshToken"],
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => MainLayout(user: data["user"]),
      ),
      (route) => false,
    );
  } else {
    print("Login failed");
  }
},
              child: const Text("LOGIN"),
            )
          ],
        ),
      ),
    );
  }
}