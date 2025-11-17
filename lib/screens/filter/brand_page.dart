// screens/filter/brand_page.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/search2.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({super.key});

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> brands = const [
    {"title": "Nike", "count": 120},
    {"title": "Adidas", "count": 95},
    {"title": "Puma", "count": 80},
    {"title": "Reebok", "count": 50},
    {"title": "Under Armour", "count": 40},
    {"title": "New Balance", "count": 30},
    {"title": "Converse", "count": 25},
    {"title": "Vans", "count": 20},
    {"title": "Fila", "count": 15},
    {"title": "Asics", "count": 10},
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
                  "BRAND",
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
          // نص "&" على خلفية رمادية
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Text(
              "&",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // قسم البحث
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: _goToSearchScreen,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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

          // نص "A" على خلفية رمادية بعد البحث
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Text(
              "A",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // قائمة البراندات
          Expanded(
            child: ListView.separated(
              itemCount: brands.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = brands[index];

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
