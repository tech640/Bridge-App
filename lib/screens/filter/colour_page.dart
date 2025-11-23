// screens/filter/colour_page.dart
import 'package:flutter/material.dart';

class ColourPage extends StatefulWidget {
  const ColourPage({super.key});

  @override
  State<ColourPage> createState() => _ColourPageState();
}

class _ColourPageState extends State<ColourPage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> colours = const [
    {"title": "Black", "count": 412, "color": Colors.black},
    {"title": "Brown", "count": 121, "color": Color(0xFFA52A2A)},
    {"title": "Red", "count": 118, "color": Colors.red},
    {"title": "Green", "count": 83, "color": Colors.green},
    {"title": "White", "count": 65, "color": Colors.white},
    {"title": "Silver", "count": 64, "color": Colors.grey},
    {"title": "Gold", "count": 56, "color": Color(0xFFFFD700)},
    {"title": "Pink", "count": 47, "color": Colors.pink},
    {"title": "Multi", "count": 44, "color": Colors.purpleAccent}, // يمكنك تعديل اللون حسب الرغبة
    {"title": "Blue", "count": 37, "color": Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf6f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Row(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "COLOUR",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "A..",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: colours.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = colours[index];

                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor: item["color"],
                    radius: 8,
                  ),
                  title: Text(
                    "${item["title"]} (${item["count"]})",
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  "VIEW ITEMS",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
