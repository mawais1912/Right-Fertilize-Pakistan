import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // For the slider
import 'package:right_fertilize_pakistan/screens/prediction_screen.dart';
import 'package:right_fertilize_pakistan/screens/profile_screen.dart';
import 'package:right_fertilize_pakistan/screens/videos_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_screen.dart';
import 'contact_screen.dart';
import 'data_entry_screen.dart';
import 'downloadmobileapp_screen.dart';
import 'feedback_screen.dart';
import 'gallery_screen.dart';
/*
import 'data_entry_screen.dart';
import 'downloadmobileapp_screen.dart';
import 'prediction_screen.dart';
import 'feedback_screen.dart';
import 'gallery_screen.dart';
import 'contact_screen.dart';
import 'about_screen.dart';
import 'videos_screen.dart';

 */

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with Hamburger Icon for Drawer
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            // Menu icon on the left
            /* IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),

          */

          //  SizedBox(width: 8),

            // Left-aligned app name (Right Fertilizer UAF)
            Flexible(
              flex: 2,
              child: Text(
                'Right Fertilizer UAF',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Spacer(),

            // Logo and Urdu text
            Flexible(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/small_image1.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'زرعی یونیورسٹی فیصل آباد',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Drawer for navigation
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lower Header with Navigation Links (optional)
            SizedBox(height: 20),

            // Part 1: Image Slider with Padding
            _buildCarouselSlider(),

            // New Section with Image and Text below the Slider
            _buildImageWithText(),

            // Add Padding between Image/Text and Cards Section
            SizedBox(height: 20),

            _buildImageWithText2(),

            // Add Padding between Image/Text and Cards Section
            SizedBox(height: 20),

            _buildImageWithText3(),

            // Add Padding between Image/Text and Cards Section
            SizedBox(height: 20),

            // Cards Section (3 cards next to each other)
            _buildCardSection(),

            // Add Padding between Cards and Social Links
            SizedBox(height: 20),

            // Cards Section (Social Links and Toll-Free Section)
            _buildSocialLinks(),
          ],
        ),
      ),

      // Footer Section
      bottomNavigationBar: buildFooter(),

      // Positioned Phone Icon (Toll-Free number replaced)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTollFreeDetails(context); // Show details when clicked
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.phone, color: Colors.white),
      ),
    );
  }

  // Show Toll-Free Details when the Floating Action Button is clicked
  void _showTollFreeDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Toll-Free Call Centre'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Call us at the Toll-Free number:'),
              SizedBox(height: 10),
              Text(
                '080054726',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'For any inquiries regarding fertilizer recommendations, you can reach us at the toll-free number mentioned above. Our team is ready to assist you with your farming needs.',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog when clicked
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Helper function to create a navigation link
  Widget _buildNavLink(BuildContext context, String text, Widget screen) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  // Carousel Slider
  Widget _buildCarouselSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),  // Horizontal Padding
      child: Container(
        width: double.infinity,
        height: 250,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
          items: [
            'assets/images/slider1.jpg',
            'assets/images/slider2.jpg',
            'assets/images/slider3.jpg',
            'assets/images/slider4.jpg',
            'assets/images/slider5.jpg',
            'assets/images/slider6.jpg',
          ].map((item) => Container(
            child: Image.asset(item, fit: BoxFit.cover, width: 1000),
          )).toList(),
        ),
      ),
    );
  }

  // Image and Text below the Slider
  Widget _buildImageWithText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Image section
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/vc_pic.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Space between image and text

          // Text section aligned to the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prof. Dr. Zulfiqar Ali',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Vice Chancellor',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'زرعی یو نیورسٹی فیصل آباد نے تہیہ کر لیا ہے کہ کسان کی خدمت اسکی دہلیز پر۔ اسی سلسلے میں اس ویب سائٹ پر کھادوں کے متعلق معلومات مہیا کی جارہی ہیں۔ ہر زمیندار اپنے موبائل یا کمپیوٹر پر یہ ویب سائٹ کھول کر اپنے ہر کھیت کیلئے اپنی مرضی کی پیداوار حاصل کرنے کیلئے نائٹروجن اور فاسفورس کی مقدار معلوم کرسکتا ہے۔',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,  // Handle overflow if text is too long
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Image and Text below the Slider 2
  Widget _buildImageWithText2() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Image section
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/usda.png'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Space between image and text

          // Text section aligned to the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'U.S. Department of Agriculture',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'USDA',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'USDA stands for U.S. Department of Agriculture and is a federal agency that Abraham Lincoln founded in 1862. The USDA is responsible for overseeing farming, ranching, and forestry industries, as well as regulating aspects of food quality and safety and nutrition labeling۔',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,  // Handle overflow if text is too long
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Image and Text below the Slider 3
  Widget _buildImageWithText3() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Image section
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/icarda.png'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Space between image and text

          // Text section aligned to the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'International Center for Agricultural Research in the Dry Areas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ICARDA',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'ICARDA Full Form: Overview, Features, Work Areas etc.ICARDA, the International Center for Agricultural Research in the Dry Areas, is an international non-profit organization that conducts research-for-development to improve the livelihoods and resilience of rural dryland communities in the non-tropical dry areas of Asia, Africa, and the Middle East ',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,  // Handle overflow if text is too long
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // Cards Section (3 Cards)
  Widget _buildCardSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildCard(
            'assets/images/slider1.jpg',
            'کھادوں کی مناسب مقدار',
            'اپنی مطلوبہ فصل کیلئے کھادوں کیلئے یہاں کلک کریں۔ ',
            'https://example.com/pdf1', // PDF link
          ),
          _buildCard(
            'assets/images/slider2.jpg',
            'پیداواری منصوبہ',
            'اپنی فصل کا پیداواری منصوبہ جاننے کیلئے یہاں کلک کریں۔',
            'https://example.com/pdf2', // PDF link
          ),
          _buildCard(
            'assets/images/slider3.jpg',
            'تجزیہ گاہوں کا پتہ',
            'اپنے ضلع میں تجز یہ گاہ کا پتہ جاننے کیلئے یہاں کلک کریں۔',
            'https://example.com/pdf3', // PDF link
          ),
        ],
      ),
    );
  }

  // Card Widget (Non-clickable)
  Widget _buildCard(String imagePath, String title, String description, String pdfLink) {
    return Expanded(
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            // Image inside the card
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Card title
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),

            // Description text (2 lines)
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              maxLines: 2,  // Ensure 2 lines
              overflow: TextOverflow.ellipsis,  // Truncate overflowed text
            ),
            SizedBox(height: 10),

            // Download PDF link
            TextButton(
              onPressed: () {
                _launchURL(pdfLink); // Launch PDF link
              },
              child: Text('Click here to view PDF'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to launch the PDF URL
  void _launchURL(String pdfLink) async {
    if (await canLaunch(pdfLink)) {
      await launch(pdfLink);
    } else {
      throw 'Could not launch $pdfLink';
    }
  }



  // Social Links Section
  Widget _buildSocialLinks() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // First Row: Two Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSocialCard(
                  'assets/images/sfr_logo.png',
                  'Soil Fertility Research Institute',
                  'www.sfripunjab.gov.pk',
                  'https://www.sfripunjab.gov.pk'
              ),
              _buildSocialCard(
                  'assets/images/facebook_logo.png',
                  'Facebook Page',
                  'Fertilizer-UAF',
                  'https://www.facebook.com/pages/Fertilizer-UAF/100761806771101'
              ),
            ],
          ),
          SizedBox(height: 20),
          // Second Row: Two Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSocialCard(
                  'assets/images/small_image1.png',
                  'University of Agriculture',
                  'www.uaf.edu.pk',
                  'https://www.uaf.edu.pk'
              ),
             /* _buildTollFreeCard(
                  'assets/images/phone_icon.png',
                  'Toll Free Call Centre # 080054726'


              ),*/
            ],
          ),
        ],
      ),
    );
  }

  // Social Card Widget
  Widget _buildSocialCard(String logoPath, String title, String description, String url) {
    return Expanded(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(logoPath, width: 80, height: 80), // Logo Image
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(description, style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => _launchURL(url), // Open URL when clicked
              child: Text('Visit Website'),
            ),
          ],
        ),
      ),
    );
  }

  // Toll-Free Card (non-clickable)
  /*
  Widget _buildTollFreeCard(String logoPath, String description) {
    return Expanded(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(logoPath, width: 80, height: 80), // Toll-Free Logo Image
            SizedBox(height: 10),
            Text(description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

   */

  // Footer Section
  // Footer Section
  Widget buildFooter() {
    return BottomAppBar(
      color: Colors.green,
      child: SafeArea(  // ensures content won't overlap with system bars
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,  // avoids taking unnecessary space
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Copyright (2025)',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'All rights reserved University of Agriculture Faisalabad Pakistan.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Drawer for navigation
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          _buildDrawerItem(context, 'Home', HomeScreen()),

          _buildDrawerItem(context, 'DataEntry', DataEntryScreen()),
          _buildDrawerItem(context, 'Prediction', PredictionScreen()),

          _buildDrawerItem(context, 'Gallery', GalleryScreen()),
          _buildDrawerItem(context, 'Contact', ContactScreen()),
          _buildDrawerItem(context, 'About', AboutScreen()),
          _buildDrawerItem(context, 'DownloadMobileApp', DownloadMobileAppScreen()),
          _buildDrawerItem(context, 'Videos', VideosScreen()),
          _buildDrawerItem(context, 'Feedback', FeedbackScreen()),
          _buildDrawerItem(context, 'Profile', ProfileScreen()),


        ],
      ),
    );
  }

  // Drawer menu items
  Widget _buildDrawerItem(BuildContext context, String text, Widget screen) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
