import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoryList = [];
  Function onViewAllClicked;
  CategoryFragment({required this.onViewAllClicked});
  @override
  Widget build(BuildContext context) {
    categoryList = CategoryModel.getCategoriesList(
        true); // bool value should be taken from the provider.
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Good Morning\nHere is Some News For You',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Stack(
                      alignment: index % 2 == 0
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                           borderRadius: BorderRadius.circular(16),
                            child: Image.asset(categoryList[index].imgPath)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.02),
                          child: ToggleSwitch(
                            customWidgets: [
                              Text('View all',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              CircleAvatar(
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColors.whiteColor,
                                ),
                                backgroundColor: AppColors.blackColor,
                              )
                            ],
                            customWidths: [width * 0.24, width * 0.15],
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Theme.of(context).primaryColor],
                              [AppColors.greyColor]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: AppColors.greenColor,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            animate: true,
                            radiusStyle: true,
                            onToggle: (value) {
                              print('switched to: $value');
                              onViewAllClicked(categoryList[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.02);
                },
                itemCount: categoryList.length))
      ],
    );
  }
}
