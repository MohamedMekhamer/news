import 'package:flutter/material.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/Home/category/Category_Screen.dart';
import 'package:news/Home/category/category_details.dart';
import 'package:news/Home/search/search_details.dart';
import 'package:news/model/category.dart';
import 'package:news/setting/setting_tab.dart';

import 'Home_Drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.WhiteColor,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/main_background.png',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchDetails());
            },
                icon: Icon(Icons.search,
                size: 40,),
            )
          ],
          title: Text(
            'News App',
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child:
          HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
        ),
        body: selectedItemDrawer == HomeDrawer.setting?
            SettingTab():
        selectedCategory == null?
             CategoryScreen(onCategoryItemClicked: onCategoryItemClicked)
            : CatergoryDetails(category: selectedCategory!),
      ),
    );
  }

  Category? selectedCategory = null;

  void onCategoryItemClicked(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  var selectedItemDrawer = HomeDrawer.categories;
  void onDrawerItemClicked(int selectedItem) {
    selectedItemDrawer = selectedItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
