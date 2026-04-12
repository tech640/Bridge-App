import 'package:flutter/material.dart';

class DriverDashboard extends StatelessWidget {
  const DriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Driver Dashboard"),
        backgroundColor: Colors.pink,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.pink),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Deliveries",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: const [
                  DeliveryCard(
                    orderId: "201",
                    customer: "Ahmad",
                    location: "Nablus",
                    status: "assigned",
                  ),
                  DeliveryCard(
                    orderId: "202",
                    customer: "Sara",
                    location: "Ramallah",
                    status: "on_the_way",
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

class DeliveryCard extends StatelessWidget {
  final String orderId;
  final String customer;
  final String location;
  final String status;

  const DeliveryCard({
    super.key,
    required this.orderId,
    required this.customer,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == "assigned"
        ? Colors.orange
        : status == "on_the_way"
            ? Colors.blue
            : Colors.green;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🧾 العنوان + الحالة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order #$orderId",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: TextStyle(
                        color: statusColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),

            // 📍 المعلومات
            Text("Customer: $customer"),
            Text("Location: $location"),

            const SizedBox(height: 10),

            // 🗺️ زر الخريطة (🔥 الجديد)
            TextButton.icon(
              onPressed: () {
                print("Open Map");
              },
              icon: const Icon(Icons.map, color: Colors.pink),
              label: const Text(
                "Open Map",
                style: TextStyle(color: Colors.pink),
              ),
            ),

            const SizedBox(height: 12),

            // 🔘 الأزرار
            Column(
              children: [

                if (status == "assigned")
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Start Delivery"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),

                if (status == "on_the_way")
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check),
                      label: const Text("Delivered"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),

                if (status == "delivered")
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Delivered ✔",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}