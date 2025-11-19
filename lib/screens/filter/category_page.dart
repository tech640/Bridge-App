// screens/filter/category_page.dart
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> categories = const [
    {"title": "Dress", "count": 592},
    {"title": "Tops", "count": 219},
    {"title": "Skirts", "count": 117},
    {"title": "Footwear", "count": 85},
    {"title": "Jeans & Trousers", "count": 56},
    {"title": "Accessories", "count": 32},
    {"title": "Shorts", "count": 29},
    {"title": "Suits & Tailoring", "count": 18},
    {"title": "All in ones", "count": 10},
    {"title": "Outerwear", "count": 10},
    {"title": "Underwear & Nightwear", "count": 9},
    {"title": "Jewellery & Watches", "count": 8},
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
                  "CATEGORY",
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
              itemCount: categories.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = categories[index];

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
