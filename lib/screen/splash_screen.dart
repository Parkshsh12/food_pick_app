import 'package:flutter/material.dart';
import 'package:food_pick_app/widget/texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SectionText(
          text: '이메일',
          textColor: Color(0xff979797),
        ),
      ),
    );
  }
}
