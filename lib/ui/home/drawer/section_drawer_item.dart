import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';

class SectionDrawerItem extends StatelessWidget {
  IconData icon;
  String text;
  SectionDrawerItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(width: width * 0.02),
        Text(
          text,
          style: AppStyles.bold20White,
        )
      ],
    );
  }
}
