// screens/filter/filter_page.dart
import 'package:flutter/material.dart';
import 'package:bridge_app/screens/filter/category_page.dart';
import 'package:bridge_app/screens/filter/size_page.dart';
import 'package:bridge_app/screens/filter/bodyFit_page.dart';
import 'package:bridge_app/screens/filter/product_type_page.dart';
import 'package:bridge_app/screens/filter/style_page.dart';
import 'package:bridge_app/screens/filter/brand_page.dart';
import 'package:bridge_app/screens/filter/colour_page.dart';
import 'package:bridge_app/screens/filter/price_page.dart';


class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf6f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // يرجع للكولكشن
          },
        ),
        centerTitle: true,
        title: const Text(
          "FILTER",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildFilterRow(
                  context,
                  title: "Category",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoryPage(),
                      ),
                    );
                  },
                ),
                _buildFilterRow(
                  context,
                  title: "Product Type",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductTypePage(),
                      ),
                    );
                  },
                  ),
                _buildFilterRow(
                  context,
                  title: "Size",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SizePage(),
                      ),
                    );
                  },
                  ),
                 _buildFilterRow(
                  context,
                  title: "Brand",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BrandPage(),
                      ),
                    );
                  },
                  ),
                _buildFilterRow(
                  context,
                  title: "Style",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StylePage(),
                      ),
                    );
                  },
                  ),
                 _buildFilterRow(
                  context,
                  title: "Colour",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ColourPage(),
                      ),
                    );
                  },
                  ),
                _buildFilterRow(
                   context,
                  title: "Body Fit",
                  value: "All",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BodyFitPage(),
                      ),
                    );
                  },
                  ),
                _buildFilterRow(
                  context,
                  title: "Price",
                  value: "\$10–\$465",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PricePage(),
                      ),
                    );
                  },
                  ),
              ],
            ),
          ),

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
                  Navigator.pop(context);  // يرجع للكولكشن
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
    );
  }

  Widget _buildFilterRow(BuildContext context,
      {required String title, required String value, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
