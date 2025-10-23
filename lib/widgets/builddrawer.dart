import 'package:flutter/material.dart';
import 'package:right_fertilize_pakistan/screens/profile_screen.dart';

import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/data_entry_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/gallery_screen.dart';
import '../screens/home_screen.dart';
import '../screens/prediction_screen.dart';
import '../screens/videos_screen.dart';



Widget buildDrawer(BuildContext context) {
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
        _buildDrawerItem(context, 'About Us', AboutScreen()),
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

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.pop(context); // Close the Drawer

  bool isSameScreen = false;
  Navigator.popUntil(context, (route) {
    if (route.settings.name == screen.runtimeType.toString()) {
      isSameScreen = true;
    }
    return true;
  });

  if (!isSameScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: screen.runtimeType.toString()), // Use runtimeType as route name
      ),
    );
  }
}

