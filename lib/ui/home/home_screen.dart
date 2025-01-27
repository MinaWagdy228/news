import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/category_details.dart';
import 'package:news/ui/home/category/category_fragment.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';
import 'package:news/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null ?
              'Home' :
                selectedCategory!.title
              , style: Theme.of(context).textTheme.headlineLarge),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.blackColor,
          child: HomeDrawer(onDrawerItem:  onDrawerItem,),
        ),
        body: selectedCategory == null
            ? CategoryFragment(onViewAllClicked: onViewAllClicked)
            : CategoryDetails(category: selectedCategory!,));
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
//todo: newSelectedCategory > user select
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  void onDrawerItem() {
    selectedCategory =null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
