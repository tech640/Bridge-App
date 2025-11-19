// screens/search.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';
import 'package:bridge_app/screens/myAccount.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/bag.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 1; // البحث غالباً موجود بالمكان الثاني في البار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// SEARCH BAR
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.camera_alt_outlined),
                    ],
                  ),
                ),
              ),

              /// TABS (WOMEN - MEN)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        "WOMEN",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 3),
                      Container(height: 2, width: 55, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(width: 40),
                  const Text(
                    "MEN",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// BANNER 50% OFF
              _bigBanner(
                title: "50% OFF 1000S",
                subtitle: "USE CODE: EEEE",
              ),

              const SizedBox(height: 12),

              /// MAIN SALE BANNER
              _bigSaleCard(),

              const SizedBox(height: 20),

              /// CATEGORY SECTIONS
              _categoryCard("NEW IN", "https://i.imgur.com/SL8QdmB.png"),
              const SizedBox(height: 12),
              _categoryCard("CLOTHING", "https://i.imgur.com/Cd0vXcT.png"),
              const SizedBox(height: 12),
              _categoryCard("SHOES", "https://i.imgur.com/9Qp21wc.png"),
              const SizedBox(height: 12),
              _categoryCard("ACCESSORIES", "https://i.imgur.com/Wv3XWSf.png"),

              const SizedBox(height: 25),

              /// RECOMMENDED SECTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              _horizontalProducts(),

              const SizedBox(height: 25),

              /// TRENDING NOW
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Trending now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              _horizontalProducts(),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  /// --- WIDGETS كما هي ---
  Widget _bigBanner({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _bigSaleCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.black,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sale",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(height: 5),
            Text("Up to 60% off",
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const Spacer(),
            Image.network(imageUrl, height: 140, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }

  Widget _horizontalProducts() {
    return SizedBox(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _productCard("https://i.imgur.com/mgQ2JrD.png"),
          _productCard("https://i.imgur.com/SL8QdmB.png"),
          _productCard("https://i.imgur.com/Wv3XWSf.png"),
        ],
      ),
    );
  }

  Widget _productCard(String image) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.network(image, height: 160, fit: BoxFit.cover),
          const SizedBox(height: 6),
          const Text("Product name",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ],
      ),
    );
  }
}
