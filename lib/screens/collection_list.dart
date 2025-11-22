import 'package:flutter/material.dart';
import 'package:bridge_app/widgets/bottom_nav.dart';

class CollectionListPage extends StatefulWidget {
  final String title;

  const CollectionListPage({
    super.key,
    required this.title,
  });

  @override
  State<CollectionListPage> createState() => _CollectionListPageState();
}

class _CollectionListPageState extends State<CollectionListPage> {
  int selectedIndex = 1; // نفس قيمة صفحة SearchPage

  @override
  Widget build(BuildContext context) {
    // القوائم المطلوبة
    List<String> newProducts = [
      "View all",
      "Clothing",
      "new in: Today",
      "new in: Selling Fast",
      "Skirts",
      "Tops",
      "Coats & Jackets",
    ];

    List<String> winterList = [
      "Winter Jackets",
      "Warm Hoodies",
      "Boots",
      "Scarves",
    ];

    List<String> hypedList = [
      "Trending Dresses",
      "Top Rated",
      "Hot Deals",
      "Viral Styles",
      "Most Liked",
      "Most Purchased",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            sectionTitle("NEW PRODUCTS"),
            buildListSection(newProducts),

            sectionTitle("WINTER"),
            buildListSection(winterList),

            sectionTitle("YOUR MOST HYPED"),
            buildListSection(hypedList),

            const SizedBox(height: 90), // مساحة للبار السفلي
          ],
        ),
      ),

      /// ====== البار السفلي نفسه تماماً ======
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() => selectedIndex = i);

          // نفس سلوك صفحة SearchPage تماماً
          if (i == 0) Navigator.pop(context);
        },
      ),
    );
  }

  // صندوق عنوان القسم
  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey.shade200,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  // قسم القوائم
  Widget buildListSection(List<String> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            width: 45,
            height: 60,
            child: Image.asset(
              "assets/img_SearchPage/clothing.webp",
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            items[index],
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
