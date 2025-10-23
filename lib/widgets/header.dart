import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomHeader({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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

          SizedBox(width: 8),

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
    );
  }
}
