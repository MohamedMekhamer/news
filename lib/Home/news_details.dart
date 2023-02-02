import 'package:flutter/material.dart';
import 'package:news/Home/My_theme.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news_details';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(12),
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
              news.title ?? '',
              style: TextStyle(color: MyTheme.greyColor, fontSize: 10),
            ),
            SizedBox(height: 10),
            Text(
              news.content ?? '',
              style: TextStyle(
                  color: MyTheme.BlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Text(
              news.publishedAt ?? '',
              style: TextStyle(color: MyTheme.greyColor, fontSize: 12),
            ),
            SizedBox(height: 10),
            Text(news.description ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      openUrl(news.url);
                    },
                    child: Text('View Full Artical',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 16, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl((uri));
    }
  }
}
