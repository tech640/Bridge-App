// screens/product_detail.dart
import 'package:bridge_app/screens/size_guide.dart';
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

  // حالة كل أكورديون (true = مفتوح، false = مغلق)
  Map<String, bool> _accordionExpanded = {
    "Product Details": false,
    "Brand": false,
    "Size & Fit": false,
    "Looking After Me": false,
    "About Me": false,
  };

  // قائمة المفضلات داخل الصفحة
  List<Map<String, dynamic>> favoritesItems = [];

  // حالة زر القلب العلوي
  bool isFavorite = false;

  // حالة زر القلب السفلي بجانب "SAVE"
  bool isFavoriteBottom = false;

  // عداد المفضلات (ابتداء من 545)
  int favoriteCount = 545;

  List<String> get productImages => widget.images;

  // المنتج الحالي (حسب معلومات الصفحة)
  Map<String, dynamic> get currentProduct => {
        "name": "ARRANGE oversized crew neck striped knit jumper",
        "price": 117.00,
        "image": productImages.isNotEmpty ? productImages[0] : "",
        "size": "M",
        "color": "Lilac/Brown",
      };

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoritesItems.removeWhere((item) => item["image"] == currentProduct["image"]);
        isFavorite = false;
        isFavoriteBottom = false;
        favoriteCount = (favoriteCount > 0) ? favoriteCount - 1 : 0;
      } else {
        favoritesItems.add(currentProduct);
        isFavorite = true;
        isFavoriteBottom = true;
        favoriteCount++;
      }
    });
  }

  void toggleFavoriteBottom() {
    setState(() {
      if (isFavoriteBottom) {
        favoritesItems.removeWhere((item) => item["image"] == currentProduct["image"]);
        isFavoriteBottom = false;
        isFavorite = false;
        favoriteCount = (favoriteCount > 0) ? favoriteCount - 1 : 0;
      } else {
        favoritesItems.add(currentProduct);
        isFavoriteBottom = true;
        isFavorite = true;
        favoriteCount++;
      }
    });

    // عرض Snackbar تأكيد
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(" Added to favorites  "),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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

                  // Save Button - مفعّل للتبديل بين مفضلة/غير مفضلة
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

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

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.favorite, color: Colors.black),
                  const SizedBox(width: 5),
                  Text(
                    "$favoriteCount",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),

              const SizedBox(height: 15),

              const Text(
                "Model: 173.5 / 58 | Wearing S - EU 36-38",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: toggleFavoriteBottom,
                      child: Column(
                        children: [
                          Icon(
                            isFavoriteBottom ? Icons.favorite : Icons.favorite_border,
                            size: 26,
                            color: isFavoriteBottom ? Colors.red : Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "SAVE",
                            style: TextStyle(
                              fontSize: 13,
                              color: isFavoriteBottom ? Colors.red : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actionItem(Icons.shop_2, "BUY THE LOOK"),
                    actionItem(Icons.play_arrow, "VIDEO"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      Map<String, dynamic> item = {
                        "name": "ARRANGE oversized crew neck striped knit jumper",
                        "price": 117.00,
                        "image": productImages[0],
                        "size": "M",
                        "color": "Lilac/Brown",
                      };

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

              ..._accordionExpanded.entries.map((entry) {
                String title = entry.key;
                bool isExpanded = entry.value;

                String content = "";
                Widget? extraWidget;

                switch (title) {
                  case "Product Details":
                    content = '''
Dresses by ARRANGE

* Floral design
* Bandeau style
* Zip-back fastening
* Kick split
* Regular fit

Product Code: 148633829
''';
                    break;

                  case "Brand":
                    content = '''
Luxe embellishments, modern silhouettes, premium fabrics and hand-painted prints are just some of the impressive design signatures of ARRANGE's capsule collections. The London-born and women-led brand is dedicated to directional pieces with a feminine edge, offering up a regular capsule of occasionwear and elevated essentials in sizes 4-30. With jeans, co-ords, separates and dresses (with pockets) in the mix, ARRANGE promises to make day-to-night dressing a breeze.
''';
                    break;

                  case "Size & Fit":
                    content = '''
Model's height: 178cm / 5' 10''
Model is wearing: EU 36
''';
                    extraWidget = Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SizeGuidePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text(
                            "View Size Guide",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                    break;

                  case "Looking After Me":
                    content = "Hand wash only";
                    break;

                  case "About Me":
                    content = '''
Velvet: a plush fabric with a soft, hairy surface

Lining: 100% Polyester, Main: 100% Polyester.
''';
                    break;
                }

                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _accordionExpanded[title] = !isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Icon(isExpanded ? Icons.remove : Icons.add),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content,
                              style:
                                  const TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                            if (extraWidget != null) extraWidget,
                          ],
                        ),
                      ),
                    const Divider(),
                  ],
                );
              }).toList(),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("YOU MIGHT ALSO LIKE",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
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

  // ===================== WIDGETS =============================

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
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgs[1],
                    height: smallHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgs[2],
                    height: increasedSmallHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
