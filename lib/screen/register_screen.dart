import 'package:flutter/material.dart';
import 'package:food_pick_app/widget/appbars.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Food PICK 가입하기',
        isLeading: true,
      ),
    );
  }
}
