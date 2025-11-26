// screens/checkout.dart
// Full CheckoutPage integrated with Bag cartItems
// Flutter Dart Code

import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutPage({super.key, required this.cartItems});

  double getSubtotal() {
    double total = 0;
    for (var i in cartItems) {
      total += (i["price"] ?? 0).toDouble();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "CHECKOUT",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PRODUCTS LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: cartItems.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                            image: item["image"] != null
                                ? DecorationImage(
                                    image: NetworkImage(item["image"]),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"] ?? "Product",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text("Size: ${item['size']}", style: const TextStyle(fontSize: 14)),
                              Text("Color: ${item['color']}", style: const TextStyle(fontSize: 14)),
                              const SizedBox(height: 8),
                              Text(
                                "\$${item['price']}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // PROMO
            sectionTile("PROMO/STUDENT CODE OR GIFT VOUCHERS/CARDS"),

            // DELIVERY ADDRESS	hinTitle("DELIVERY ADDRESS"),
            addressButtons(),

            // FREE RETURNS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              color: const Color(0xffe3f2fd),
              child: const Row(
                children: [
                  Icon(Icons.lock, size: 20),
                  SizedBox(width: 8),
                  Text("You get FREE Returns", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            hinTitle("PAYMENT"),

            // TOTALS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  priceRow("Sub-total", "\$${getSubtotal().toStringAsFixed(2)}"),
                  const SizedBox(height: 4),
                  priceRow("Total to pay", "\$${getSubtotal().toStringAsFixed(2)}"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // BUY NOW
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffc8eed1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  "BUY NOW",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By placing your order you agree to our terms and conditions, privacy and returns policies.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // ------- Widgets -------

  Widget hinTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 18, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget sectionTile(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget addressButtons() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text("ADD POSTAL ADDRESS", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
        const Text("OR", style: TextStyle(fontSize: 14)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text("CLICK & COLLECT", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }

  Widget priceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }
}