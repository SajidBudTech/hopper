import 'package:flutter/material.dart';

import '../../models/hopperItem.dart';
import '../../models/hopperModel.dart';

class StoryHopperCard extends StatelessWidget {
  StoryHopperCard({
    this.hopperIndex,
    this.hopperItem,
    this.hopper,
    //this.moveAction,
    //this.removeAction,
    this.isLast,
  });
  final int hopperIndex;
  final HopperItem hopperItem;
  final HopperModel hopper;
  //final Function moveAction;
  //final Function removeAction;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "${this.hopperIndex + 1}.",
              textAlign: TextAlign.left,
              textScaleFactor: 2.0,
              style: Theme.of(context).textTheme.caption,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              tooltip: "Remove from Hopper",
              iconSize: 30,
              padding: EdgeInsets.all(0),
              onPressed: () => hopper.removeHopperEntry(this.hopperIndex),
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                width: 9999,
                child: Text(
                  this.hopperItem.story.headline,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /*Expanded(
                    child: Text(
                      "${this.author}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),*/
                  Icon(
                    Icons.access_time,
                    size: 15,
                  ),
                  Text(
                    " ${this.hopperItem.story.duration.round()}m",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.right,
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.expand_less),
              tooltip: "Move Up",
              iconSize: 40,
              padding: EdgeInsets.all(0),
              onPressed: this.hopperIndex == 0
                  ? null
                  : () => hopper.moveHopperItem(this.hopperIndex, -1),
            ),
            IconButton(
              icon: const Icon(Icons.expand_more),
              tooltip: "Move Down",
              iconSize: 40,
              padding: EdgeInsets.all(0),
              onPressed: isLast
                  ? null
                  : () => hopper.moveHopperItem(this.hopperIndex, 1),
            ),
          ],
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
