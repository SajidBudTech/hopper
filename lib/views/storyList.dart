import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'components/storyBrowseCard.dart';
import '../models/storyItem.dart';

class StoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoryListState();
  }
}

class _StoryListState extends State<StoryList> {
  List<StoryItem> _stories = [];
  bool _loaded = false;

  void loadData() async {
    QueryBuilder<ParseObject> queryStories =
        QueryBuilder<ParseObject>(ParseObject('Story'))
          ..whereEqualTo('hidden', false)
          ..includeObject(['publication'])
          ..setLimit(20);
    final ParseResponse responseStories = await queryStories.query();
    if (responseStories.success && responseStories.results != null) {
      for (var story in responseStories.results) {
        StoryItem storyItem = StoryItem();
        storyItem.headline = story.get<String>('headline');
        storyItem.subhead = story.get<String>('subhead');
        storyItem.url = story.get<String>('url');
        storyItem.date = story.get<DateTime>('publishDate');

        print(story);
      }
    }
  }

  void loadDataTest(BuildContext context) async {
    var bundle = DefaultAssetBundle.of(context);
    var stringData = await bundle.loadString('data/test_data.json');
    var data = json.decode(stringData);
    List<StoryItem> loadedStories = [];
    for (var storyData in data['stories']) {
      loadedStories.add(StoryItem(
        storyId: storyData['storyId'],
        headline: storyData['headline'],
        subhead: storyData['subhead'],
        fileAddress: storyData['fileAddress'],
        publication: storyData['publication'],
        author: storyData['author'],
        narrator: storyData['narrator'],
        date: stringToDate(storyData['date']),
        duration: storyData['duration'],
        url: storyData['url'] != null ? storyData['url'] : "",
      ));
    }
    setState(() {
      if (_stories != null) {
        _stories.addAll(loadedStories);
      } else {
        _stories = loadedStories;
      }
      _loaded = true;
    });
  }

  // Create a datetime out of a MM/DD/YYYY string, with or without leading digits
  DateTime stringToDate(String monthDayYear) {
    var parts = monthDayYear.split("/");
    //print("p0: ${parts[0]}, p1: ${parts[1]}, p2: ${parts[2]}");
    var dt = DateTime(
        int.tryParse(parts[2]), int.tryParse(parts[0]), int.tryParse(parts[1]));
    //print(dt);
    return dt;
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      loadDataTest(context);
      loadData();
    }
    //DefaultAssetBundle.of(context);
    return Material(
      color: Theme.of(context).backgroundColor,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: _stories != null ? _stories.length : 0,
        itemBuilder: (BuildContext context, int index) {
          return new StoryBrowseCard(
            story: _stories[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
