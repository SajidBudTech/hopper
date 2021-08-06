import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/hopperModel.dart';
import '../../models/storyItem.dart';

class StoryBrowseCard extends StatelessWidget {
  StoryBrowseCard({
    this.story,
  });
  final StoryItem story;
  /*
      {this.headline,
      this.preview,
      this.author,
      this.narrator,
      this.date,
      this.publication,
      this.duration,
      this.image});
  final String headline;
  final String author;
  final String narrator;
  final String date;
  final String preview;
  final String publication;
  final double duration;
  final Image image;*/

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 9999,
                  child: Text(
                    this.story.headline,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      //flex: 10,
                      child: Text(
                        "${this.story.publication}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Text(
                      "${this.story.dateToString()}",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${this.story.author}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Icon(
                      Icons.access_time,
                      size: 15,
                    ),
                    Text(
                      " ${this.story.duration.round()}m",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
              ]),
        ),
        Consumer<HopperModel>(
          builder: (context, hopper, child) => Column(
            children: [
              IconButton(
                icon: Icon(Icons.play_circle_outline),
                tooltip: "Play Now",
                iconSize: 40,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  hopper.addStoryToHopperAndPlay(this.story);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Playing "${this.story.headline}"')));
                },
              ),
              IconButton(
                icon: hopper.hopperContains(this.story)
                    ? Icon(Icons.playlist_add_check)
                    : Icon(Icons.playlist_add),
                tooltip: "Add to Hopper",
                iconSize: 40,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  hopper.addStoryToHopperQueue(this.story);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text('"${this.story.headline}" added to Hopper')));
                },
              ),
            ],
          ),
        ),
      ],
    );

    /*return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.indigoAccent,
                ),
                Text(
                  this.headline,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Author\n${this.author}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "Narrator\n${this.narrator}",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.play_circle_outline),
              onPressed: null,
            ),
            IconButton(
              icon: const Icon(Icons.playlist_add),
              onPressed: null,
            ),
          ],
        ),
      ],
    );*/

    /*return Container(
      height: 150,
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Stack(children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.indigo[300],
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle_outline),
                  iconSize: 80.0,
                  tooltip: 'Play Article',
                  color: Colors.black,
                  onPressed: null,
                ),
              ]),
              Column(
                children: [
                  //Expanded(
                  new Text(
                    this.headline,
                    style: Theme.of(context).textTheme.headline4,
                    //overflow: TextOverflow.fade,
                  ),
                  //),
                  //),
                  Flexible(
                    child: Text(
                      this.publication,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade,
                    ),
                  )
                  //),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  this.preview,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          )
        ],
      ),
    );*/
  }
}
