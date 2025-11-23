// screens/filter/bodyFit_page.dart
import 'package:flutter/material.dart';

class BodyFitPage extends StatefulWidget {
  const BodyFitPage({super.key});

  @override
  State<BodyFitPage> createState() => _BodyFitPageState();
}

class _BodyFitPageState extends State<BodyFitPage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> bodyFits = const [
    {"title": "Main Collection", "count": 1063},
    {"title": "Plus Size", "count": 62},
    {"title": "Petite", "count": 24},
    {"title": "Wide Fit", "count": 10},
    {"title": "Tall", "count": 7},
    {"title": "Maternity", "count": 2},
    {"title": "Fuller Bust", "count": 1},
   
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
            Navigator.pop(context); // يرجع لفلتر
          },
        ),
        centerTitle: true,
        title: Row(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "Body Fit",
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
                color: Colors.grey, // اللون رمادي
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
              itemCount: bodyFits.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = bodyFits[index];

                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // تفعيل الاختيار
                    });
                  },
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
                  Navigator.popUntil(context, (route) => route.isFirst); // يرجع للكولكشن
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
