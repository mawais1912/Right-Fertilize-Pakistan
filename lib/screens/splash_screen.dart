import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Adjust the import based on your project structure

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation1;
  late Animation<double> _textAnimation2;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define animations with fade and scale
    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _textAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animations after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });

    // Navigate to SignUpScreen after 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (optional)
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your actual background
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated round image with blue border
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  FadeTransition(
                    opacity: _imageAnimation,
                    child: ScaleTransition(
                      scale: _imageAnimation,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/small_image1.png', // Replace with your actual image
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FadeTransition(
                    opacity: _imageAnimation,
                    child: ScaleTransition(
                      scale: _imageAnimation,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/usda.png', // Replace with your actual image
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                    const SizedBox(width: 20),
                    FadeTransition(
                      opacity: _imageAnimation,
                      child: ScaleTransition(
                        scale: _imageAnimation,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/icarda.png', // Replace with your actual image
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
            ]
                ),
                const SizedBox(height: 20),
                // First animated text
                FadeTransition(
                  opacity: _textAnimation1,
                  child: ScaleTransition(
                    scale: _textAnimation1,
                    child: const Text(
                      "Balanced fertilizers, better harvests – Make every grain count!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Second animated text (Urdu)
                FadeTransition(
                  opacity: _textAnimation2,
                  child: ScaleTransition(
                    scale: _textAnimation2,
                    child: const Text(
                      "متوازن کھاد، بہتر پیداوار!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _textAnimation2,
                  child: ScaleTransition(
                    scale: _textAnimation2,
                    child: const Text(
                      "FERTILIZE RIGHT PAKISTAN PROJECT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),

                FadeTransition(
                  opacity: _textAnimation2,
                  child: ScaleTransition(
                    scale: _textAnimation2,
                    child: const Text(
                      "Funded by USDA-ICARDA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                const SizedBox(height: 100),
                FadeTransition(
                  opacity: _textAnimation2,
                  child: ScaleTransition(
                    scale: _textAnimation2,
                    child: const Text(
                      "University of Agriculture Faisalabad",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),

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
