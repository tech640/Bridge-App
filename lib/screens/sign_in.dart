// screens/sign_in.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/api_service.dart';
import 'package:bridge_app/screens/main_layout.dart'; // ✅ مهم جداً
import 'package:bridge_app/screens/PasswordPage.dart';
import 'package:bridge_app/screens/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // ================= BACKEND =================
  final TextEditingController phoneController = TextEditingController();
  // ================= BACKEND =================
  // ================= BACKEND =================
static final emailController = TextEditingController();
// ================= BACKEND =================

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

              // ===== BACK BUTTON =====
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // ===== TOP CONTAINER =====
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      color: Colors.white24,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/icons/logoSignIn.jfif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Hi Friend!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Enter your EMAIL to sign in",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 24),

              // ===== FEATURES =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  featureItem(icon: Icons.discount, text: "Exclusive\ndiscounts"),
                  featureItem(icon: Icons.local_shipping, text: "Tracked\ndelivery"),
                  featureItem(icon: Icons.shopping_cart_checkout, text: "Fast\ncheckout"),
                ],
              ),

              const SizedBox(height: 30),

              // ===== PHONE FIELD =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "EMAIL:*",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),

              const SizedBox(height: 6),

              // ================= BACKEND =================
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email Address",
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              // ================= BACKEND =================

              const SizedBox(height: 20),

              // ===== CONTINUE BUTTON =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.black,
                  ),

                  // ================= BACKEND =================
                  // ================= BACKEND =================
onPressed: () async {
  final email = emailController.text;

  if (email.isEmpty) {
    print("اكتبي الإيميل");
    return;
  }

  final exists = await ApiService.checkUser(email);

  if (exists) {
    // 👉 المستخدم موجود → روح صفحة كلمة السر
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PasswordPage(email: email),
      ),
    );
  } else {
    // 👉 مستخدم جديد → روح تسجيل
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpPage(),
      ),
    );
  }
},
// ================= BACKEND =================,
                  // ================= BACKEND =================

                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("or continue with"),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialImageButton(
                    imagePath: "assets/icons/google.png",
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  socialImageButton(
                    imagePath: "assets/icons/facebook.png",
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  socialButton(
                    icon: FontAwesomeIcons.apple,
                    iconColor: Colors.black,
                    onTap: () {},
                  ),
                ],
              )
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
        Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget socialButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12),
        ),
        child: Icon(icon, size: 22, color: iconColor),
      ),
    );
  }

  Widget socialImageButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12),
        ),
        child: Image.asset(imagePath, width: 28, height: 28),
      ),
    );
  }
}