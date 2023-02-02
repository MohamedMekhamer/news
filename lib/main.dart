import 'package:flutter/material.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/Home/home_screen.dart';
import 'package:news/Home/news_details.dart';

void main(){
  runApp(MyApp());
}
class MyApp  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
        NewsDetails.routeName:(context)=> NewsDetails(),
      },
      theme: MyTheme.lightTheme,

    );
  }
}
