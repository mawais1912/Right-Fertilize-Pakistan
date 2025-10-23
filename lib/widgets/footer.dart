import 'package:flutter/material.dart';



Widget _buildFooter() {
  return BottomAppBar(
    color: Colors.green,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          SizedBox(height: 10),
          Text(
            'Copyright (2025) All rights reserved University of Agriculture Faisalabad Pakistan.',
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}