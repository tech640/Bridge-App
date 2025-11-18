// screens/sign_up.dart
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Center(
                child: Column(
                  children: const [
                    Icon(Icons.account_circle, size: 90, color: Colors.black87),
                    SizedBox(height: 10),
                    Text(
                      "We love new faces :)",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Email
              const Text("EMAIL:*", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Example@gmail.com",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("EDIT"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // First name
              const Text("FIRST NAME:*", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 20),

              // Last name
              const Text("LAST NAME:*", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 20),

              // Password
              const Text("PASSWORD:*", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => showPassword = !showPassword),
                  ),
                ),
              ),

              const SizedBox(height: 6),
              const Text("Must be 10 or more characters", style: TextStyle(fontSize: 12)),

              const SizedBox(height: 20),

              // Date of Birth
              const Text("DATE OF BIRTH:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              Row(
                children: [
                  // Day
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDay,
                      items: List.generate(31, (i) => (i + 1).toString())
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) => setState(() => selectedDay = v),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Day",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Month
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      items: List.generate(12, (i) => (i + 1).toString())
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) => setState(() => selectedMonth = v),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Month",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Year
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedYear,
                      items: List.generate(90, (i) => (2024 - i).toString())
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) => setState(() => selectedYear = v),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Year",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("SIGN UP", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}