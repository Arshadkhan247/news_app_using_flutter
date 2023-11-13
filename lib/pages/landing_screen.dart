import 'package:flutter/material.dart';
import 'package:news_app_using_flutter/pages/home_screen.dart';
import 'package:news_app_using_flutter/utilities/Style/text_style.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(30, 20),
                bottomRight: Radius.elliptical(30, 20)),
            child: Image.asset(
              'assets/landing.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'News from around the\nworld for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Best time to read! take your time to read\n a little more of this world',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Material(
            borderRadius: BorderRadius.circular(40),
            elevation: 8,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.orange.shade600,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: headingStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
