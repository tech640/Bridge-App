// screens/search.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';

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
        child: Column(
          children: [
            // الجزء الثابت - البحث والتبويبات
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
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.camera_alt_outlined),
                  ],
                ),
              ),
            ),

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

            const SizedBox(height: 10),

            // الجزء القابل للتمرير - باقي المحتوى
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

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
                    _categoryCard("NEW IN", "assets/img_SearchPage/newIn.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("CLOTHING", "assets/img_SearchPage/clothing.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("SHOES", "assets/img_SearchPage/shoes.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("ACCESSORIES", "assets/img_SearchPage/accessories.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("FACE+BODY", "assets/img_SearchPage/face&body.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("DRESSES", "assets/img_SearchPage/dresses.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("GIFTING", "assets/img_SearchPage/gifting.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("BRANDS", "assets/img_SearchPage/brands.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("ACTIVEWEAR", "assets/img_SearchPage/activeWear.webp"),
                    const SizedBox(height: 12),
                    _categoryCard("TRAINERS", "assets/img_SearchPage/trainers.webp"),

                    const SizedBox(height: 25),

                    _topShopBanner(),

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
          ],
        ),
      ),

      /// ===== BOTTOM NAV BAR =====
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() => selectedIndex = i);

          if (i == 0) Navigator.pop(context); // الضغط على Home → يرجع للهوم
        },
      ),
    );
  }

  /// --- WIDGETS ---

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
            Image.asset(imageUrl, height: 140, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }

  Widget _topShopBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "TOPSHOP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
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
          _productCard("assets/images/fashion3.jpeg"),
          _productCard("assets/images/fashion3.jpeg"),
          _productCard("assets/images/fashion3.jpeg"),
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
          Image.asset(image, height: 160, fit: BoxFit.cover),
          const SizedBox(height: 6),
          const Text("Product name",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ],
      ),
    );
  }
}
