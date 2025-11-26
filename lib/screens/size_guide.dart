import 'package:flutter/material.dart';

class SizeGuidePage extends StatefulWidget {
  @override
  _SizeGuidePageState createState() => _SizeGuidePageState();
}

class _SizeGuidePageState extends State<SizeGuidePage> {
  bool isCm = true; // CM / IN toggle

  // دالة التحويل الجديدة
  double _convert(double value) {
    return isCm ? value : (value / 2.54);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "SIZE GUIDE",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------------------------
            // CM / IN SWITCH
            // -----------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _unitButton("CM", isCm),
                  const SizedBox(width: 10),
                  _unitButton("IN", !isCm),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // -----------------------------------------------
            // MAIN SIZE TABLE
            // -----------------------------------------------
            _buildMainSizeTable(),

            const SizedBox(height: 30),

            // -----------------------------------------------
            // INTERNATIONAL
            // -----------------------------------------------
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "INTERNATIONAL CONVERSIONS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            _buildInternationalTable(),

            const SizedBox(height: 30),

            // -----------------------------------------------
            // FIXED HOW TO MEASURE
            // -----------------------------------------------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "HOW TO MEASURE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            // -----------------------------------------------
            // EXPANDABLES
            // -----------------------------------------------

            _buildExpandableCategory(
              title: "Clothing",
              image: "assets/img_SizeGuide/Clothing.jpeg",
              steps: [
                "1- Bust - Measure around the fullest part.",
                "2- Waist - Measure around natural waistline.",
                "3- Hips - Feet together, measure around the fullest part.",
                "4- Inside Leg - Measure from top of the inside leg at crotch to ankle bone.",
              ],
            ),

            _buildExpandableCategory(
              title: "Footwear",
              image: "assets/img_SizeGuide/footwear.jfif",
              steps: [
                "1- Measure your foot length by placing a ruler flat alongside the inside of your foot.",
                "2- Place an object with a flat edge across your toes touching the longest toe.",
                "3- Take the measurement in millimeters at the crossing point.",
                "4- If one foot is longer, use the larger measurement.",
                "5- If between sizes, select the larger size.",
              ],
            ),

            _buildExpandableCategory(
              title: "Lingerie",
              image: "assets/img_SizeGuide/lingerie.jfif",
              steps: [
                "1- Bust - Measure around the fullest part.",
                "2- Underbust - Measure below the bust around the ribcage.",
                "3- Waist - Measure around natural waistline.",
                "4- Hips - Feet together, measure around the fullest part.",
                "5- Inside Leg - Measure from top of inner leg to ankle bone.",
              ],
            ),

            _buildExpandableCategory(
              title: "Rings",
              image: "assets/img_SizeGuide/rings.jfif",
              steps: [
                "1- Wrap a thin strip of paper around the finger.",
                "2- Mark where the ends meet.",
                "3- Measure length to get circumference.",
                "4- Match measurement with chart.",
                "5- If between sizes, choose smaller.",
                "6- Remember which finger you measured.",
              ],
            ),

            _buildExpandableCategory(
              title: "Hats",
              image: "assets/img_SizeGuide/hats.jfif",
              steps: [
                "1- Place tape around head circumference.",
                "2- Across forehead and above ears.",
                "3- Round to nearest size.",
              ],
            ),

            _buildExpandableCategory(
              title: "Gloves",
              image: "assets/img_SizeGuide/gloves.jfif",
              steps: [
                "1- Measure hand at widest point.",
                "2- Round to nearest size.",
              ],
            ),

            _buildExpandableCategory(
              title: "Belts",
              image: "assets/img_SizeGuide/belts.jfif",
              steps: [
                "1- Thread tape measure through belt loops.",
                "2- Round up to nearest inch.",
              ],
            ),

            _buildExpandableCategory(
              title: "Tights",
              image: "assets/img_SizeGuide/tights.jfif",
              steps: [
                "1- Height - Measure from head to floor.",
                "2- Hips - Measure around fullest part.",
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // UNIT BUTTON
  // ==========================================================
  Widget _unitButton(String text, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isCm = (text == "CM")),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          color: active ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // ==========================================================
  // MAIN TABLE (WITH CONVERSION)
  // ==========================================================
  Widget _buildMainSizeTable() {
    final List<List<String>> rawData = [
      ["UK 4", "79", "76", "84", "60"],
      ["UK 6", "81.5", "78.5", "86.5", "62.5"],
      ["UK 8", "84", "81", "89", "65"],
      ["UK 10", "89", "86", "94", "70"],
      ["UK 12", "94", "91", "99", "75"],
      ["UK 14", "99", "96", "104", "80"],
      ["UK 16", "104", "101", "109", "85"],
      ["UK 18", "111", "108", "116", "92"],
    ];

    // تحويل كل القيم باستثناء الـ Size
    final convertedRows = rawData.map((row) {
      return [
        row[0], // Size ثابت
        _convert(double.parse(row[1])).toStringAsFixed(1),
        _convert(double.parse(row[2])).toStringAsFixed(1),
        _convert(double.parse(row[3])).toStringAsFixed(1),
        _convert(double.parse(row[4])).toStringAsFixed(1),
      ];
    }).toList();

    return _buildTable(
      headers: ["Size", "Bust", "Hip", "Low Hip", "Waist"],
      rows: convertedRows,
    );
  }

  // ==========================================================
  // INTERNATIONAL TABLE
  // ==========================================================
  Widget _buildInternationalTable() {
    final List<List<String>> data = [
      ["UK 4", "EU 32", "UK 4", "US 0", "IT 36"],
      ["UK 6", "EU 34", "UK 6", "US 2", "IT 38"],
      ["UK 8", "EU 36", "UK 8", "US 4", "IT 40"],
      ["UK 10", "EU 38", "UK 10", "US 6", "IT 42"],
      ["UK 12", "EU 40", "UK 12", "US 8", "IT 44"],
      ["UK 14", "EU 42", "UK 14", "US 10", "IT 46"],
      ["UK 16", "EU 44", "UK 16", "US 12", "IT 48"],
      ["UK 18", "EU 46", "UK 18", "US 14", "IT 50"],
    ];

    return _buildTable(
      headers: ["Size", "EU", "UK", "US", "IT"],
      rows: data,
    );
  }

  // ==========================================================
  // REUSABLE TABLE
  // ==========================================================
  Widget _buildTable({
    required List<String> headers,
    required List<List<String>> rows,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateColor.resolveWith((_) => Colors.black),
        headingTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        columns: headers.map((h) => DataColumn(label: Text(h))).toList(),
        rows: rows
            .map(
              (row) => DataRow(
                cells: row.map((c) => DataCell(Text(c))).toList(),
              ),
            )
            .toList(),
      ),
    );
  }

  // ==========================================================
  // STEP TEXT
  // ==========================================================
  Widget _measureStep(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // ==========================================================
  // EXPANDABLE CATEGORY
  // ==========================================================
  Widget _buildExpandableCategory({
    required String title,
    required String image,
    required List<String> steps,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 220,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 15),

              for (var s in steps) _measureStep(s),
            ],
          ),
        ),
      ],
    );
  }
}
