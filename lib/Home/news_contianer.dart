import 'package:flutter/material.dart';
import 'package:news/Api_manger.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/Home/news_item.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourcesResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  List<News> newsList =[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponce>(
        future: ApiManger.getNews(sourceId: widget.source.id?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
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
           newsList.addAll(snapshot.data?.articles ?? []);
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index],);
            },
            itemCount: newsList.length,
          );
        });
  }
}
