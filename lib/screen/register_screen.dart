import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_pick_app/widget/appbars.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? profileImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Food PICK 가입하기',
        isLeading: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            child: _buildProfile(),
            onTap: () {
              showBottomSheetAboutProfile();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    if (profileImg == null) {
      return Center(
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 48,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 48,
          ),
        ),
      );
    } else {
      return Center(
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 48,
          backgroundImage: FileImage(profileImg!),
        ),
      );
    }
  }

  void showBottomSheetAboutProfile() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  getCameraImage();
                },
                child: Text(
                  '사진촬영',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context)
                },
                child: Text(
                  '앨범에서 사진 선택',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '프로필 사진 삭제',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> getCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        profileImg = File(image.path);
      });
    }
  }
}
