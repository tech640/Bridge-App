// screens/filter/price_page.dart
import 'package:flutter/material.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  double _minPrice = 10;
  double _maxPrice = 465;

  double _barWidth = 0;
  final double _circleSize = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf6f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "PRICE",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // نصوص الأسعار فوق الدوائر باللون الأسود
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${_minPrice.toInt()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${_maxPrice.toInt()}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // شريط السعر مع الدوائر القابلة للسحب
            LayoutBuilder(
              builder: (context, constraints) {
                _barWidth = constraints.maxWidth;
                double minPos =
                    ((_minPrice - 10) / (465 - 10)) * (_barWidth - _circleSize);
                double maxPos =
                    ((_maxPrice - 10) / (465 - 10)) * (_barWidth - _circleSize);

                return SizedBox(
                  height: _circleSize,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // الشريط
                      Positioned(
                        top: (_circleSize / 2) - 2,
                        left: 0,
                        right: 0,
                        child: Container(height: 4, color: Colors.grey[400]),
                      ),

                      // الحد الأدنى
                      Positioned(
                        left: minPos,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            setState(() {
                              double newMin =
                                  (_minPrice +
                                          (details.delta.dx /
                                                  (_barWidth - _circleSize)) *
                                              (465 - 10))
                                      .clamp(10, _maxPrice);
                              _minPrice = newMin;
                            });
                          },
                          child: _buildCircle(),
                        ),
                      ),

                      // الحد الأقصى
                      Positioned(
                        left: maxPos,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            setState(() {
                              double newMax =
                                  (_maxPrice +
                                          (details.delta.dx /
                                                  (_barWidth - _circleSize)) *
                                              (465 - 10))
                                      .clamp(_minPrice, 465);
                              _maxPrice = newMax;
                            });
                          },
                          child: _buildCircle(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const Spacer(),

            // الزر مثل صفحة الكاتيجوري
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    "VIEW ITEMS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: _circleSize,
      height: _circleSize,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
