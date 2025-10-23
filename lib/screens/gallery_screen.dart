import 'package:flutter/material.dart';

import '../widgets/base_screen.dart';


class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    /*'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/15.jpg', */// Add more images here as required
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Meeting Highlights
              Text(
                'Project Meeting Highlights',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Dynamic Rows
              ..._buildDynamicRows(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a row of three image cards
  Widget _buildImageRow(int index1, int index2, int index3) {
    // Check to ensure that the indices do not exceed the length of the list
    if (index1 >= imagePaths.length) return SizedBox(); // Return empty if out of range
    if (index2 >= imagePaths.length) index2 = index1;
    if (index3 >= imagePaths.length) index3 = index2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildImageCard(imagePaths[index1]),
        _buildImageCard(imagePaths[index2]),
        _buildImageCard(imagePaths[index3]),
      ],
    );
  }

  // Helper function to build an image card
  Widget _buildImageCard(String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _showFullScreenImage(imagePath); // Open full-screen image on tap
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 150, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the full-screen image when tapped
  void _showFullScreenImage(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.9),
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              Center(
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildDynamicRows() {
    List<Widget> rows = [];
    for (int i = 0; i < imagePaths.length; i += 3) {
      rows.add(_buildImageRow(i, i + 1, i + 2));
      rows.add(const SizedBox(height: 20));
    }
    return rows;
  }
}
