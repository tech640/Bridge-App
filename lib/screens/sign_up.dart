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

  // قائمة الأشهر
  final List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  // الاهتمامات
  List<String> interests = [];
  final List<String> allInterests = [
    "Women Clothes",
    "Men Clothes",
    "Kids Clothes"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // === زر الرجوع ===
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
          onPressed: () {
                    Navigator.pop(context); // ترجع خطوة لورا فقط
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =======================
              //    TOP BLACK BOX
              // =======================
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/logoSignIn.jfif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Title
              const Center(
                child: Text(
                  "We love new faces :)",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // =======================
              // EMAIL
              // =======================
              const Text("EMAIL:*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Example@gmail.com",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // =======================
              // FIRST NAME
              // =======================
              const Text("FIRST NAME:*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 20),

              // =======================
              // LAST NAME
              // =======================
              const Text("LAST NAME:*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 20),

              // =======================
              // PASSWORD
              // =======================
              const Text("PASSWORD:*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () =>
                        setState(() => showPassword = !showPassword),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text("Must be 10 or more characters",
                  style: TextStyle(fontSize: 12)),

              const SizedBox(height: 20),

              // =======================
              // DATE OF BIRTH
              // =======================
              const Text("DATE OF BIRTH:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              Row(
                children: [
                  // Day
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDay,
                      items: List.generate(
                              31, (index) => (index + 1).toString())
                          .map((d) =>
                              DropdownMenuItem(value: d, child: Text(d)))
                          .toList(),
                      onChanged: (v) => setState(() => selectedDay = v),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Day",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Month (names)
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      items: months
                          .map((m) =>
                              DropdownMenuItem(value: m, child: Text(m)))
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
                      items: List.generate(
                              100, (i) => (2024 - i).toString())
                          .map((y) =>
                              DropdownMenuItem(value: y, child: Text(y)))
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

              const SizedBox(height: 25),

              // =======================
              // MOSTLY INTERESTED IN
              // =======================
              const Text("MOSTLY INTERESTED IN:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              Wrap(
                spacing: 12,
                children: allInterests.map((item) {
                  bool selected = interests.contains(item);

                  return ChoiceChip(
                    label: Text(item),
                    selected: selected,
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black),
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          interests.add(item);
                        } else {
                          interests.remove(item);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 40),

              // =======================
              // SIGN UP BUTTON
              // =======================
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("SIGN UP", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
