import 'package:flutter/material.dart';
import 'package:news/Home/My_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int setting =2;
  Function onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: MyTheme.primaryLightColor,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Expanded(
              child: Center(
                child: Text(
                  'News App!',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClicked(HomeDrawer.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClicked(HomeDrawer.setting);

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
