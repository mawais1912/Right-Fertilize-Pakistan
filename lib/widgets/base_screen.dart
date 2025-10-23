import 'package:flutter/material.dart';
import 'builddrawer.dart';
import 'header.dart';  // Import the custom header widget
import 'footer.dart';  // Import the footer widget

class BaseScreen extends StatelessWidget {
  final Widget body; // The body of each screen (page content)

  BaseScreen({required this.body}); // Constructor to pass the body dynamically

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(), // Use the custom header with the drawer
      body: SingleChildScrollView(child: body), // Pass the dynamic body content
      drawer: buildDrawer(context), // Use the drawer for navigation
      bottomNavigationBar: buildFooter(), // Use the custom footer
    );
  }

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




}
