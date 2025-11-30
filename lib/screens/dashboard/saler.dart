// screens/dashboard/saler.dart
import 'package:flutter/material.dart';

class SellerDashboardPage extends StatelessWidget {
  const SellerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------- HEADER -------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Saler Dashboard",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_none, size: 26),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black12,
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ------------------- CARDS -------------------
              Row(
                children: [
                  Expanded(
                      child: _statCard(Icons.attach_money, "Total Sales",
                          "\$4,820", Colors.pink)),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _statCard(
                          Icons.work, "Orders", "145", Colors.pink)),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                      child: _statCard(Icons.check_circle, "Delivered", "120",
                          Colors.green)),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _statCard(Icons.refresh, "Returned", "6",
                          Colors.grey)),
                ],
              ),

              const SizedBox(height: 25),

              // ------------------- SALES THIS WEEK -------------------
              const Text(
                "Sales This Week",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomPaint(
                  painter: _SimpleLineChart(),
                ),
              ),

              const SizedBox(height: 25),

              // ------------------- RECENT ORDERS -------------------
              const Text(
                "Recent Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _recentOrderItem("Long Sleeve Dress", "\$45.00", "Delivered",
                  Colors.green, "assets/icons/dress.png"),
              _recentOrderItem("Blue T-shirt", "\$25.00", "Pending",
                  Colors.orange, "assets/icons/tshirt.png"),
              _recentOrderItem("Red Hoodie", "\$30.00", "in progress",
                  Colors.blue, "assets/icons/hoodie.png"),

              const SizedBox(height: 25),

              // ------------------- PRODUCTS -------------------
              const Text(
                "Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Add New Product",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              _productItem("Red T-shirt", "\$20.00", Colors.red,
                  "assets/icons/red_tshirt.png"),
              _productItem("Blue Jeans", "\$30.00", Colors.blue,
                  "assets/icons/jeans.png"),
              _productItem(
                  "Black Hat", "\$15.00", Colors.black, "assets/icons/hat.png"),
              _productItem("Pink Sneakers", "\$50.00", Colors.pink,
                  "assets/icons/shoes.png"),

              const SizedBox(height: 25),

              // ------------------- MONTHLY REVENUE (ADDED) -------------------
              const Text(
                "Monthly Revenue",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: _MonthlyBarChart(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "View Detailed Report",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ------------------- ORDERS LIST -------------------
              const Text(
                "Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              _orderItem("#1123", "21 Oct", "\$50.00", "Delivered"),
              _orderItem("#1124", "20 Oct", "\$40.00", "Delivered"),
              _orderItem("#1125", "19 Oct", "\$62.00", "Pending"),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- WIDGETS -------------------

  static Widget _statCard(
      IconData icon, String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 15)),
              Text(
                value,
                style: TextStyle(
                    fontSize: 18, color: color, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Widget _recentOrderItem(String name, String price, String status,
      Color statusColor, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16)),
                Text(price, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text(status, style: TextStyle(color: statusColor)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  static Widget _productItem(
      String name, String price, Color color, String imgPath) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Image.asset(imgPath, width: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Text("$name\n$price",
                style: const TextStyle(fontSize: 16, height: 1.3)),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  static Widget _orderItem(
      String id, String date, String amount, String status) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text("$id\n$date\n$amount",
                style: const TextStyle(fontSize: 16, height: 1.4)),
          ),
          Text(status, style: const TextStyle(color: Colors.green)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

// ------------------- SIMPLE LINE CHART -------------------
class _SimpleLineChart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.pink
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    final points = [
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.2, size.height * 0.5),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.4),
      Offset(size.width, size.height * 0.2),
    ];

    path.moveTo(points.first.dx, points.first.dy);
    for (var p in points) {
      path.lineTo(p.dx, p.dy);
    }

    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ------------------- MONTHLY BAR CHART (ADDED) -------------------
class _MonthlyBarChart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    final textPainter =
        TextPainter(textDirection: TextDirection.ltr, textAlign: TextAlign.center);

    final values = [140, 165, 175, 190, 160, 230, 185];
    final labels = ["Jun", "Feb", "Mar", "Ap", "May", "Jul", "Aug"];

    final barWidth = size.width / values.length * 0.27;

    for (int i = 0; i < values.length; i++) {
      double x = (size.width / values.length) * i + barWidth;
      double barHeight = (values[i] / 230) * size.height;

      canvas.drawRect(
        Rect.fromLTWH(x, size.height - barHeight, barWidth, barHeight),
        barPaint,
      );

      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x, size.height + 4));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
