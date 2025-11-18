import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ===== TOP IMAGE =====
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Logo Here",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ===== TITLE =====
              const Text(
                "Hi Friend!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                "Enter your email to sign in or join for",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 24),

              // ===== 3 FEATURES =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  featureItem(
                    icon: Icons.discount,
                    text: "Exclusive\ndiscounts",
                  ),
                  featureItem(
                    icon: Icons.local_shipping,
                    text: "Easily tracked\ndelivers & returns",
                  ),
                  featureItem(
                    icon: Icons.shopping_cart_checkout,
                    text: "Speedy\ncheckout",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ===== EMAIL FIELD =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "EMAIL:*",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== CONTINUE BUTTON =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("or continue with"),

              const SizedBox(height: 16),

              // ===== SOCIAL BUTTONS =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(
                    icon: FontAwesomeIcons.google,
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  socialButton(
                    icon: FontAwesomeIcons.facebookF,
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  socialButton(
                    icon: FontAwesomeIcons.apple,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Helpers =====

  Widget featureItem({required IconData icon, required String text}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget socialButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12),
        ),
        child: Icon(icon, size: 22),
      ),
    );
  }
}
