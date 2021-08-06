import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/hopperModel.dart';
import '../models/storyItem.dart';
import '../models/hopperItem.dart';
import 'components/emptyHopper.dart';
import 'components/storyHopperCard.dart';

class StoryHopper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoryHopperState();
  }
}

class _StoryHopperState extends State<StoryHopper> {
  Widget _hopperContent(BuildContext context, HopperModel hopper) {
    if (hopper.isEmpty()) {
      return EmptyHopper();
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: hopper.currentHopper.length,
        itemBuilder: (BuildContext context, int index) {
          return new StoryHopperCard(
            hopperIndex: index,
            hopperItem: hopper.currentHopper[index],
            hopper: hopper,
            isLast: index == hopper.currentHopper.length - 1,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Consumer<HopperModel>(
          builder: (context, hopper, child) => _hopperContent(context, hopper)),
    );
  }
}
