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

  bool showPassword = false; // 👈 للتحكم بإظهار/إخفاء الباسورد

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

            // ================= PASSWORD FIELD =================
            TextField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Password",

                // 👁️ زر العين
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final password = passwordController.text;

                // ================= VALIDATION =================
                if (password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter password")),
                  );
                  return;
                }

                // ================= BACKEND =================
                final data = await ApiService.login(
                  widget.email,
                  password,
                );

                // ================= RESPONSE CHECK =================
                if (data != null && data["accessToken"] != null) {

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
                  // ❌ باسورد غلط أو فشل
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wrong password")),
                  );
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