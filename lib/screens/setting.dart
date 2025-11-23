// screens/setting.dart
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "SETTINGS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      body: ListView(
        children: [
          _settingItem("Deliver to", "Palestine", () {}),
          _settingItem("Currency", "\$USD", () {}),
          _settingItem("Sizes", "EU", () {}),
          _settingItem("Notifications", "All", () {}),
          _settingItem("Shop", "Women", () {}),
          _settingItem("Screenshots", "All", () {}),
          _settingItem("Appearance", "All", () {}),

          const SizedBox(height: 10),

          _simpleItem("Privacy Policy", () {}),
        ],
      ),
    );
  }

  // --------------------------
  // ITEM WITH LEFT + RIGHT + >
  // --------------------------
  Widget _settingItem(String title, String value, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
          onTap: onTap,
        ),
        const Divider(height: 0),
      ],
    );
  }

  // --------------------------
  // SIMPLE ITEM FOR PRIVACY
  // --------------------------
  Widget _simpleItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}