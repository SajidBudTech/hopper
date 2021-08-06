import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/audioControls.dart';
import '../models/hopperModel.dart';
import 'components/storyDetails.dart';
import 'components/emptyHopper.dart';

class NowPlayingView extends StatelessWidget {
  NowPlayingView();
  //String url;
  //String imageURL;

  // void getMetaData() async {
  //   String url = Uri.encodeFull(storyItem.url);
  //   var data = await extract(url);
  //   imageURL = data.image;
  // }

  List<Widget> _getContent(HopperModel hopper) {
    if (hopper.isEmpty()) {
      return [EmptyHopper()];
    } else {
      return [
        StoryDetails(story: hopper.getCurrent().story),
        AudioControls(hopper: hopper)
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    //getMetaData();
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Consumer<HopperModel>(
        builder: (context, hopper, child) => MultiProvider(
          providers: [
            StreamProvider<Duration>.value(
              initialData: const Duration(),
              value: hopper.audioPlayer.onAudioPositionChanged,
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _getContent(hopper),
          ),
        ),
      ),
    );
  }
}
