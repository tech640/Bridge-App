// screens/product_detail.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/bag.dart';

class ProductDetailsPage extends StatefulWidget {
  final List<String> images; // الصور القادمة من صفحة الهوم

  const ProductDetailsPage({super.key, required this.images});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedIndex = 0;
  int currentImage = 0;

  // نستخدم الصور القادمة بدل الصور الثابتة
  List<String> get productImages => widget.images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // ================= MAIN IMAGE SLIDER =================
              Stack(
                children: [
                  SizedBox(
                    height: 490,
                    child: PageView(
                      onPageChanged: (i) {
                        setState(() => currentImage = i);
                      },
                      children: productImages
                          .map(
                            (img) => Container(
                              color: Colors.white,
                              child: Image.asset(img, fit: BoxFit.cover),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Back Button
                  Positioned(
                    left: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  // Save Button
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ================= SLIDER INDICATORS =================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  productImages.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      color: i == currentImage ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ================= LIKES =================
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.favorite, color: Colors.black),
                  SizedBox(width: 5),
                  Text(
                    "545",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                "Model: 173.5 / 58 | Wearing S - EU 36-38",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),

              const SizedBox(height: 20),

              // ================= ACTION BUTTONS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    actionItem(Icons.favorite_border, "SAVE"),
                    actionItem(Icons.shop_2, "BUY THE LOOK"),
                    actionItem(Icons.play_arrow, "VIDEO"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ================= COLOR SECTION =================
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "COLOUR: Lilac/Brown",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    colorBox("assets/img_ProductDetails/i1.jfif"),
                    const SizedBox(width: 10),
                    colorBox("assets/img_ProductDetails/i2.jfif"),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$ 117.00",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ARRANGE oversized crew neck striped knit jumper in lilac and brown",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xffe3f0ff),
                  ),
                  child: const Center(
                    child: Text(
                      "Get 25% off with code : EEEEE",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("LILAC/BROWN",
                        style: TextStyle(fontSize: 15, color: Colors.black54)),
                    Row(
                      children: const [
                        Text(
                          "SIZE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      // تجهيز العنصر
                      Map<String, dynamic> item = {
                        "name": "ARRANGE oversized crew neck striped knit jumper",
                        "price": 117.00,
                        "image": productImages[0],
                        "size": "M",
                        "color": "Lilac/Brown",
                      };

                      // مؤقتاً نمرره لصفحة الحقيبة
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BagPage(
                            loggedIn: true,
                            cartItems: [item],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "ADD TO BAG",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black45)),
                  child: Row(
                    children: const [
                      Icon(Icons.local_shipping_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Free delivery on qualifying orders. View our Delivery & Returns Policy",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              accordionTile("Product Details"),
              accordionTile("Brand"),
              accordionTile("Size & Fit"),
              accordionTile("Looking After Me"),
              accordionTile("About Me"),

              const SizedBox(height: 30),

              // ================= YOU MIGHT ALSO LIKE =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("YOU MIGHT ALSO LIKE",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("16 items", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              horizontalProductsList(),

              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("BUY THE LOOK",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 10),

              buyTheLookGrid(),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("PEOPLE ALSO BOUGHT",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("16 items", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              horizontalProductsList(),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      
    );
  }

  // ===========================================================
  // ===================== WIDGETS =============================
  // ===========================================================

  Widget actionItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 26),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget colorBox(String img) {
    return Container(
      width: 80,
      height: 95,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      child: Image.asset(img, fit: BoxFit.cover),
    );
  }

  Widget accordionTile(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const Icon(Icons.add),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget horizontalProductsList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          productItem("assets/images/fashion1.jpeg", "\$ 45.00"),
          productItem("assets/images/fashion2.jpeg", "\$ 45.00"),
          productItem("assets/images/fashion3.jpeg", "\$ 45.00"),
        ],
      ),
    );
  }

  Widget productItem(String img, String price) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              img,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          const Text("Long Sleeve Dress", style: TextStyle(fontSize: 13)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              const Icon(Icons.favorite_border, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget buyTheLookGrid() {
    List<String> imgs = [
      "assets/images/fashion1.jpeg",
      "assets/images/fashion3.jpeg",
      "assets/images/f1.jfif",
      "assets/images/f2.jfif",
      "assets/images/f3.jfif",
    ];

    double bigHeight = 320;
    double smallHeight = (bigHeight * 0.6) / 2;
    double increasedSmallHeight = smallHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imgs[0],
                height: bigHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: increasedSmallHeight,
                  child: Row(
                    children: [
                      smallLookImage(imgs[1]),
                      const SizedBox(width: 8),
                      smallLookImage(imgs[2]),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: increasedSmallHeight,
                  child: Row(
                    children: [
                      smallLookImage(imgs[3]),
                      const SizedBox(width: 8),
                      smallLookImage(imgs[4]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget smallLookImage(String img) {
    return Flexible(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
      ),
    );
  }
}
