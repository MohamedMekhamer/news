import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/Home/news_details.dart';

import '../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).pushNamed(NewsDetails.routeName,
      arguments: news),
      child: Container(
        padding:EdgeInsets.all(12) ,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(height: 10),
            Text(
              news.author ?? '',
              style: TextStyle(color: MyTheme.greyColor, fontSize: 10),
            ),
            SizedBox(height: 10),

            Text(
              news.title ?? '',
              style: TextStyle(color: MyTheme.BlackColor, fontSize: 12,
              fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),

            Text(
              news.publishedAt ?? '',
              style: TextStyle(color: MyTheme.greyColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
