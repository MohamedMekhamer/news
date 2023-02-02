import 'package:flutter/material.dart';
import 'package:news/Api_manger.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/Home/tab_container.dart';
import 'package:news/model/SourcesResponse.dart';
import 'package:news/model/category.dart';

class CatergoryDetails extends StatelessWidget {
  Category category;
  CatergoryDetails({
    required this.category
});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponce>(
        future: ApiManger.getSources(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: MyTheme.primaryLightColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          return TabContainer(sourcesList: sourcesList);
        });
  }
}
