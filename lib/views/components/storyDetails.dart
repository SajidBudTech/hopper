import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'metadataPreviewImage.dart';
import '../../models/storyItem.dart';

class StoryDetails extends StatelessWidget {
  StoryDetails({this.story});
  final StoryItem story;

  void _launchURL(String pageUrl) async {
    String url = Uri.encodeFull(pageUrl);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              "${this.story.headline}",
              //"This is the Headline of this Particular Story that is Playing",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
              textScaleFactor: 1,
            ),
          ),
          Expanded(
            child: ListView(
                //padding: EdgeInsets.symmetric(vertical: 10),
                clipBehavior: Clip.hardEdge,
                children: [
                 /* MetadataPreviewImage(
                    fit: BoxFit.cover,
                    height: 200,
                    pageURL: this.story.url,
                    story: this.story,
                  ),*/
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    imageUrl: this.story.url,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              this.story.publication,
                              //"The Blue Pork Times Sunday Morning Magazine Edition",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                          Container(
                            //color: Colors.green,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "${this.story.dateToString()}",
                              //"Narrated by N. A. Rator",
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                    child: Text(
                      "by ${this.story.author}",
                      //"by Author McAutherson, the big a neat author of the entire mcautherson clan",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                    child: Text(
                      "Narrated by ${this.story.narrator}",
                      //"Narrated by N. A. Rator",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  // Expanded(
                  //child:
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      //"This is the spicy subheading that describes the actual content of the article, and also hooks the reader in so they'd like to keep reading. It might be kinda long though, which is why I'm adding all these extra words. Turns out this might not be long enough to scroll in this particular case, howerver",
                      "${this.story.subhead}",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1,
                      textScaleFactor: 1.5,
                    ),
                  ),
                  // ),
                  if (this.story.url.isNotEmpty)
                    OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.link),
                          Text("  View Original"),
                        ],
                      ),
                      onPressed: () => _launchURL(this.story.url),
                    )
                ]),
          ),
        ],
      ),
    );
  }
}
