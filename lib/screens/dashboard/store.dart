import 'package:flutter/material.dart';

class StoreDashboard extends StatelessWidget {
  const StoreDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
  backgroundColor: Colors.pink,
  title: const Text("Store Dashboard"),

  actions: [
    PopupMenuButton<String>(
      icon: const Icon(Icons.account_circle, size: 28),
      onSelected: (value) {
        if (value == "profile") {
          print("Go to profile");
        } else if (value == "logout") {
          print("Logout");
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "profile",
          child: Text("Profile"),
        ),
        const PopupMenuItem(
          value: "logout",
          child: Text("Logout"),
        ),
      ],
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 عنوان
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current Orders",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            // 📦 قائمة الطلبات
            Expanded(
              child: ListView(
                children: const [
                  OrderCard(
                    orderId: "123",
                    customer: "Ahmad",
                    itemsCount: 3,
                    time: "5 min ago",
                    status: "new",
                  ),
                  OrderCard(
                    orderId: "124",
                    customer: "Sara",
                    itemsCount: 2,
                    time: "10 min ago",
                    status: "processing",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String customer;
  final int itemsCount;
  final String time;
  final String status;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.customer,
    required this.itemsCount,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
  children: [

    // 🟠 زر Processing
    if (status == "new")
      SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.access_time),
          label: const Text(
            "Start Preparing",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

    // 🟢 زر Ready
    if (status == "processing")
      SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.check_circle),
          label: const Text(
            "Ready for Pickup",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

    // 🟢 حالة جاهز
    if (status == "ready")
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Order Ready ✔",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
  ],
)
      ),
    );
  }
}