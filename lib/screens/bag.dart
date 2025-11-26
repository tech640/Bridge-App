// screens/bag.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/favorite.dart';
import 'package:bridge_app/screens/home.dart';
import 'package:bridge_app/screens/sign_in.dart';
import 'package:bridge_app/screens/sign_up.dart';
import 'package:bridge_app/screens/main_layout.dart';
import 'package:bridge_app/screens/checkout.dart';



class BagPage extends StatefulWidget {
  final bool loggedIn;
  final List<Map<String, dynamic>> cartItems;

  const BagPage({
    super.key,
    this.loggedIn = true,
    this.cartItems = const [],
  });

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  late bool loggedIn;
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    loggedIn = widget.loggedIn;
    cartItems = List.from(widget.cartItems);
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedIn) {
      return const _NotLoggedInView();
    } else if (cartItems.isEmpty) {
      return const _LoggedInEmptyBagView();
    } else {
      return _BagWithItemsView(
        cartItems: cartItems,
        onRemove: removeItem,
      );
    }
  }
}

///////////////////////////////////////////////////////////////
/// 1) NOT LOGGED IN
///////////////////////////////////////////////////////////////
class _NotLoggedInView extends StatelessWidget {
  const _NotLoggedInView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("BAG", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.yellow,
                child: Text("😕", style: TextStyle(fontSize: 40)),
              ),
              const SizedBox(height: 20),
              const Text(
                "YOUR BAG IS EMPTY",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sign in to see Your bag and get shopping",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainLayoutWrapper(
                          child: SignInPage(), // بدون const
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("SIGN IN"),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainLayoutWrapper(
                          child: SignUpPage(), // بدون const
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                  ),
                  child: const Text(
                    "JOIN",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// 2) LOGGED IN + EMPTY BAG
///////////////////////////////////////////////////////////////
class _LoggedInEmptyBagView extends StatelessWidget {
  const _LoggedInEmptyBagView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY BAG"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.yellow,
              child: Text("😐", style: TextStyle(fontSize: 40)),
            ),
            const SizedBox(height: 15),
            const Text(
              "YOUR BAG IS EMPTY",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Items are reserved for you in your bag for 60 minutes\nand then moved to Saved Items.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritePage()),
                );
              },
              child: const Text("VIEW SAVED ITEMS"),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text("START SHOPPING"),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// 3) LOGGED IN + ITEMS IN BAG
///////////////////////////////////////////////////////////////
class _BagWithItemsView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int index) onRemove;

  const _BagWithItemsView({
    required this.cartItems,
    required this.onRemove,
  });

  String _getSubtotal() {
    double total = 0;
    for (var i in cartItems) {
      total += (i["price"] ?? 0).toDouble();
    }
    return "\$${total.toStringAsFixed(2)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY BAG"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: const Text(
              "Want free delivery? Spend another \$15.16 to qualify.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text("Size: ${item['size'] ?? 'M'}"),
                            Text("Color: ${item['color'] ?? 'Black'}"),
                            const SizedBox(height: 10),
                            Text(
                              "\$${item['price'] ?? 0}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => onRemove(index),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SummaryRow(label: "Subtotal", value: _getSubtotal()),
                const SizedBox(height: 6),
                const _SummaryRow(label: "Delivery", value: "FREE"),
                const Divider(height: 22),
                _SummaryRow(label: "Total", value: _getSubtotal(), bold: true),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CheckoutPage(cartItems: cartItems)),
                      );
                    },
                    child: const Text(
                      "CHECKOUT",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// SUMMARY ROW
///////////////////////////////////////////////////////////////
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
