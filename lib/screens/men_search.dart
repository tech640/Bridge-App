import 'package:flutter/material.dart';
import 'package:bridge_app/screens/collection.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/bag.dart';
import 'package:bridge_app/screens/myAccount.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';  // استيراد ويدجت البار السفلي

class MenSearchPage extends StatefulWidget {
  const MenSearchPage({super.key});

  @override
  State<MenSearchPage> createState() => _MenSearchPageState();
}

class _MenSearchPageState extends State<MenSearchPage> {
  int selectedIndex = 1; // حسب ترتيب الأيقونات في BottomNavBar

  void onItemTapped(int index) {
    if (index == selectedIndex) return;

    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
        break;
      case 1:
        // نحن في صفحة البحث (MEN) نفسها، لا نفعل شيء
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BagPage()),
        );
        break;
      case 3:
        // إذا عندك صفحة المفضلة، ضع هنا التنقل لها، أو اتركها
        // حالياً لا توجد صفحة مفضلة مذكورة، لذا سأتركها فارغة
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MyAccountPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
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

            /// TABS MEN / WOMEN
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // العودة إلى صفحة النساء
                  },
                  child: const Text(
                    "WOMEN",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),

                const SizedBox(width: 40),

                Column(
                  children: [
                    const Text(
                      "MEN",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Container(height: 2, width: 55, color: Colors.blue),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    _bigBanner("50% OFF MEN", "USE CODE: MMMM"),

                    const SizedBox(height: 12),

                    _bigSaleCard(),

                    const SizedBox(height: 20),

                    _menCategory("NEW IN", "assets/img_SearchPage/newInMen.webp", context),
                    _menCategory("CLOTHING", "assets/img_SearchPage/clothingMen.webp", context),
                    _menCategory("SHOES", "assets/img_SearchPage/shoesMen.webp", context),
                    _menCategory("ACCESSORIES", "assets/img_SearchPage/clothingMen.webp", context),
                    _menCategory("SPORT", "assets/img_SearchPage/newInMen.webp", context),

                    const SizedBox(height: 20),

                    _topShopBanner(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CollectionPage(title: "TOPSHOP MEN"),
                        ),
                      );
                    }),

                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // دمج ويدجت البار السفلي الجاهز
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  Widget _bigBanner(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.black,
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
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.black,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sale",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 5),
            Text("Up to 60% off",
                style: TextStyle(color: Colors.white, fontSize: 26)),
          ],
        ),
      ),
    );
  }

  Widget _menCategory(String title, String img, BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (_) => CollectionPage(title: title),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          height: 150,
          color: Colors.grey.shade200,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Spacer(),
              Image.asset(img, height: 140),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topShopBanner({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          color: Colors.black,
          child: const Text(
            "TOPSHOP MEN",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
