import 'package:flutter/material.dart';
import 'package:news/ui/home/drawer/section_drawer_item.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItem;
  HomeDrawer({required this.onDrawerItem});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: height * 0.2,
          width: width,
          color: AppColors.whiteColor,
          child: Center(
            child: Text(
              'News App',
              style: AppStyles.bold24Black,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        InkWell(
            onTap: () {
              // todo: go to home
              onDrawerItem();
            },
            child: SectionDrawerItem(
                icon: Icons.home_outlined, text: 'Go to home')),
        SizedBox(height: height * 0.02),
        Divider(
          indent: width * 0.02,
          endIndent: width * 0.02,
        ),
        SizedBox(height: height * 0.02),
        SectionDrawerItem(icon: Icons.layers_outlined, text: 'Theme'),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.whiteColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
                size: 30,
              )
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Divider(
          indent: width * 0.02,
          endIndent: width * 0.02,
        ),
        SizedBox(height: height * 0.02),
        SectionDrawerItem(icon: Icons.language, text: 'Language'),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.whiteColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
                size: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
