// screens/search2.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Search2Page extends StatefulWidget {
  @override
  _Search2PageState createState() => _Search2PageState();
}

class _Search2PageState extends State<Search2Page> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    await _picker.pickImage(source: ImageSource.camera);
  }

  Future<void> _openGallery() async {
    await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Icon(Icons.search, size: 40, color: Colors.black54),
          SizedBox(height: 10),
          Text(
            "You have no recent searches.",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 40),
          Text(
            "SEEN A LOOK ON SOCIAL?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text("Take a screenshot to search for something similar"),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(Icons.camera_alt, "CAMERA", _openCamera),
              SizedBox(width: 15),
              _buildActionButton(Icons.photo, "PHOTOS", _openGallery),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            SizedBox(height: 5),
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
