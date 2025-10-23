import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:right_fertilize_pakistan/screens/data_entry_screen.dart';
import 'package:right_fertilize_pakistan/screens/feedback_screen.dart';
import 'package:right_fertilize_pakistan/screens/gallery_screen.dart';
import 'package:right_fertilize_pakistan/screens/home_screen.dart';
import 'package:right_fertilize_pakistan/screens/signin_screen.dart';
import 'package:right_fertilize_pakistan/screens/videos_screen.dart';
import 'package:right_fertilize_pakistan/screens/splash_screen.dart';
import 'firebase_options.dart'; // This is the file you just generated!

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Right Fertilize Pakistan',
      debugShowCheckedModeBanner: false,
      home: const AuthChecker(), // Check user state here
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while checking
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // User is logged in, show HomeScreen
          return HomeScreen(); // Replace with your HomeScreen
        } else {
          // User is not logged in, show SignInScreen
          return SplashScreen();
        }
      },
    );
  }
}
