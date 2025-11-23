// screens/home.dart
import 'package:bridge_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/collection.dart';
import 'package:bridge_app/screens/search.dart';
import 'package:bridge_app/screens/forYou.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openCollection(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CollectionPage(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf6f8),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // ===== SEARCH BAR =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                  ),
                  height: 40,
                  child: const Row(
                    children: [
                      Icon(Icons.search, size: 20),
                      SizedBox(width: 10),
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ===== TABS (HOME / FOR YOU) =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HOME",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pink,
                    decorationThickness: 3,
                  ),
                ),
                const SizedBox(width: 25),
                 GestureDetector(
                   onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ForYouPage()),
                    );
                  },
                 child: const Text(
                  "FOR YOU",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
               ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== BANNER =====
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text(
                    "Big Sale",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Up to 50% off most clothing",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Fashion Image =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/fashion.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ===== PARTY PREVIEW HEADER =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "The Party preview",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "SHOP NOW",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== صف صورتين ProductCard =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProductCard(image: "assets/images/fashion1.png"),
                SizedBox(width: 15),
                ProductCard(image: "assets/images/fashion2.png"),
              ],
            ),

            const SizedBox(height: 30),

            // ===== Banner Black =====
            Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: const [
                  Text(
                    "Log in and shop styles\nspecially selected for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "TAKE ME THERE",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ===== NEW IN TITLE =====
            const Center(
              child: Text(
                "New In",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 25),

            // ===== 4 صور New In =====
            // ===== 4 صور New In مع إضافة الربط =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => openCollection(context, "Occasions"),
                  child: imageBoxBlackText("assets/images/fashion1.jpeg", "Occasions"),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => openCollection(context, "New in Trainers"),
                  child: imageBoxBlackText("assets/images/fashion2.jpeg", "New in Trainers"),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => openCollection(context, "The Latest fashion"),
                  child: imageBoxBlackText("assets/images/fashion1.jpeg", "The Latest\nfashion"),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => openCollection(context, "The Sourced Collection"),
                  child: imageBoxBlackText("assets/images/fashion2.jpeg", "The Sourced\nCollection"),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ===== 30% OFF TEXT =====
            const Center(
              child: Text(
                "The up to 30% off edit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // ===== REPEAT ProductCard =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProductCard(image: "assets/images/fashion3.jpeg"),
                SizedBox(width: 15),
                ProductCard(image: "assets/images/fashion2.png"),
              ],
            ),

            const SizedBox(height: 35),

            // ===== SHOP NOW BIG BUTTON =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              color: Colors.black,
              child: const Center(
                child: Text(
                  "SHOP NOW",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ================= PRODUCT CARD =================
// ================= PRODUCT CARD =================
// ================= PRODUCT CARD =================
class ProductCard extends StatelessWidget {
  final String image;
  const ProductCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(
              images: [
                image,                   // الصورة الرئيسية
                image,                   // تكرار مؤقت (لحد ما تضيفي صور أخرى)
                image,
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 165,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Container(
              height: 190,
              color: Colors.grey[100],
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            const Text(
              "Long Sleeve Dress",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            const Text(
              "\$ 45.00",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.favorite_border),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}



// ================= 2 صور مع شريط أسود بالنص =================
Widget imageBoxBlackText(String img, String lbl) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 165,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: 165,
        height: 40,
        color: Colors.black.withOpacity(0.6),
        alignment: Alignment.center,
        child: Text(
          lbl,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    ],
  );
}
