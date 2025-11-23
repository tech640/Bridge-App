import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final bool loggedIn;
  final List<Map<String, dynamic>> favoritesItems;

  const FavoritePage({
    super.key,
    this.loggedIn = true,
    this.favoritesItems = const [],
  });

  @override
  State<FavoritePage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritePage> {
  late bool loggedIn;
  late List<Map<String, dynamic>> favoritesItems;

  @override
  void initState() {
    super.initState();
    loggedIn = widget.loggedIn;
    favoritesItems = List.from(widget.favoritesItems);
  }

  void removeItem(int index) {
    setState(() {
      favoritesItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedIn) {
      return const _FavNotLoggedInView();
    } else if (favoritesItems.isEmpty) {
      return const _FavLoggedInEmptyView();
    } else {
      return _FavWithItemsView(
        items: favoritesItems,
        onRemove: removeItem,
      );
    }
  }
}

///////////////////////////////////////////////////////////////
/// 1) NOT LOGGED IN — SAME UI AS IMAGE
///////////////////////////////////////////////////////////////
class _FavNotLoggedInView extends StatelessWidget {
  const _FavNotLoggedInView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SAVED ITEMS", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.yellow,
                child: Text("🙁", style: TextStyle(fontSize: 40)),
              ),
              const SizedBox(height: 20),
              const Text(
                "NOTHING SAVED",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "...no worries. Join to start saving, or sign in to see what you've already saved.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("SIGN IN"),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
                  child: const Text("JOIN", style: TextStyle(color: Colors.black)),
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
/// 2) LOGGED IN + EMPTY FAVORITES (Same style as images)
///////////////////////////////////////////////////////////////
class _FavLoggedInEmptyView extends StatelessWidget {
  const _FavLoggedInEmptyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SAVED ITEMS", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
            const SizedBox(height: 20),
            const Text(
              "NOTHING SAVED",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 15),
            
            const Text(
  "... no worries. Join to start saving, or\n"
  "sign in to see what you've already\n"
  "saved. Shopping made way easy.",
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 14),
),
            const SizedBox(height: 25),
           
            OutlinedButton(
              onPressed: () {},
              child: const Text("START SHOPPING"),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
/// 3) LOGGED IN + FAVORITE ITEMS (Same style as ASOS UI)
///////////////////////////////////////////////////////////////
class _FavWithItemsView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Function(int index) onRemove;

  const _FavWithItemsView({required this.items, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SAVED ITEMS", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 120,
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
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("Size: ${item['size'] ?? '—'}"),
                      Text("Color: ${item['color'] ?? '—'}"),
                      const SizedBox(height: 8),
                      Text(
                        "\$${item['price'] ?? 0}",
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 38,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("MOVE TO BAG", style: TextStyle(fontSize: 12)),
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
    );
  }
}
