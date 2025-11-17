// screens/filter/style_page.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/search2.dart';

class StylePage extends StatefulWidget {
  const StylePage({super.key});

  @override
  State<StylePage> createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> styles = const [
    {"title": "Other", "count": 177},
    {"title": "Long Sleeve", "count": 188},
    {"title": "A Line", "count": 107},
    {"title": "Heeled", "count": 63},
    {"title": "Split", "count": 62},
    {"title": "Slip", "count": 49},
    {"title": "Regular", "count": 47},
    {"title": "Backless", "count": 45},
    {"title": "Cut Out ", "count": 45},
    {"title": "Bandeau", "count": 43},
  ];


  void _goToSearchScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Search2Page()),
    );
  }

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
                  "Style",
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
        // قسم البحث تحت العنوان
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: _goToSearchScreen,
              child: Container(
                height: 40, // حجم أصغر
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // corner radius
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: styles.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = styles[index];

                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
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
