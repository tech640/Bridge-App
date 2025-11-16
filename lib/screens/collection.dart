// screens/collection.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';

class CollectionPage extends StatefulWidget {
  final String title;

  const CollectionPage({super.key, required this.title});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/fashion1.png",
      "name": "Long Sleeve Dress",
      "price": 45.00,
    },
    {
      "image": "assets/images/fashion2.png",
      "name": "Black T-Shirt",
      "price": 29.00,
    },
    {
      "image": "assets/images/fashion3.jpeg",
      "name": "Party Dress",
      "price": 55.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // ===== COUNT + FILTER & SORT =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${products.length} items",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.filter_list, size: 22),
                    SizedBox(width: 20),
                    Icon(Icons.swap_vert, size: 22),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ===== GRID PRODUCTS =====
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .62,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (_, i) {
                final item = products[i];
                return productCard(item);
              },
            ),
          ),
        ],
      ),

      // ====== BOTTOM NAV BAR (نفس تبع الهوم) ======
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() => selectedIndex = i);

          if (i == 0) Navigator.pop(context); // يرجع على الهوم
        },
      ),
    );
  }

  // ===== PRODUCT CARD =====
  Widget productCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Container(
            height: 170,
            color: Colors.grey[100],
            child: Image.asset(item["image"], fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),

          Text(
            item["name"],
            style: const TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 5),

          Text(
            "\$ ${item["price"].toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Icon(Icons.favorite_border),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
