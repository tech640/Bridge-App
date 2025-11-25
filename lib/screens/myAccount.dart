// screens/myAccount.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/setting.dart';
import 'package:bridge_app/screens/sign_in.dart';
import 'package:bridge_app/screens/sign_up.dart';
import 'package:bridge_app/screens/main_layout.dart';



class MyAccountPage extends StatelessWidget {
  final bool isLoggedIn;

  // const MyAccountPage({super.key, this.isLoggedIn = true});
  const MyAccountPage({super.key, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "MY ACCOUNT",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingPage()),
              );
            },
            icon: Image.asset(
              "assets/icons/settings.png",
              height: 24,
            ),
          )
        ],
      ),

      body: isLoggedIn ? _loggedInView(context) : _loggedOutView(context),
    );
  }

  Widget _loggedOutView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.yellow,
            child: Text("😉", style: TextStyle(fontSize: 40)),
          ),
          const SizedBox(height: 20),

          const Text(
            "COME ON IN",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            "View orders and update\nYour details",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: 220,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                        builder: (_) => MainLayoutWrapper(
                          child: SignInPage(), // بدون const
                        ),
                      ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text("SIGN IN"),
            ),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                  MaterialPageRoute(
                        builder: (_) => MainLayoutWrapper(
                          child: SignUpPage(), // بدون const
                        ),
                      ),
              );
            },
            child: const Text(
              "JOIN",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  // --------------------------
  // 2) VIEW IF LOGGED IN
  // --------------------------
  Widget _loggedInView(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Center(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black,
            child: const Text(
              "HM",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _item("My orders", Icons.shopping_bag, () {}),
        _item("Need help?", Icons.help_outline, () {}),
        _item("Gift cards & vouchers", Icons.card_giftcard, () {}),
        _item("My details", Icons.person, () {}),
        _item("Address book", Icons.home_outlined, () {}),
        _item("Payment methods", Icons.credit_card, () {}),
        _item("Contact preferences", Icons.message_outlined, () {}),
        _item("Social accounts", Icons.people_outline, () {}),
        _item("I need a new returns note", Icons.receipt_long_outlined, () {}),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.black),
          title: const Text("Sign out", style: TextStyle(color: Colors.black)),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _item(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title),
          onTap: onTap,
        ),
        const Divider(height: 0),
      ],
    );
  }
}
