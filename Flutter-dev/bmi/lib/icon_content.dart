import 'package:flutter/material.dart';

class IconsContent extends StatelessWidget {
  IconsContent({required this.genderIcon, required this.gender});
  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
        )
      ],
    );
  }
}
