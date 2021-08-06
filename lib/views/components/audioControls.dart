import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/hopperModel.dart';

class AudioControls extends StatefulWidget {
  AudioControls({this.hopper});
  HopperModel hopper;
  @override
  createState() => _AudioControlsState(hopper: hopper);
}

class _AudioControlsState extends State<AudioControls> {
  _AudioControlsState({this.hopper});

  HopperModel hopper;
  //AudioModel audio;

  @override
  Widget build(BuildContext context) {
    final audioPosition = Provider.of<Duration>(context);
    return Column(children: [
      Container(
        padding: EdgeInsets.all(5.0),
        //color: Theme.of(context).colorScheme.primaryVariant,
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primaryVariant),
          //backgroundColor: Theme.of(context).colorScheme.primaryVariant,
          backgroundColor: Theme.of(context).buttonColor,
          value: hopper.duration > 0
              ? audioPosition.inMilliseconds / hopper.duration
              : 0,
          minHeight: 35.0,
        ),
        //   Row(
        //   children: [
        //     Text(
        //       "[Progress Bar Here]",
        //       textAlign: TextAlign.center,
        //       style: Theme.of(context).textTheme.caption,
        //     ),
        //   ],
        // ),
      ),
      Container(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous),
              tooltip: "Restart",
              iconSize: 60,
              padding: EdgeInsets.all(0),
              onPressed: () {
                hopper.restart();
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay_10),
              tooltip: "Rewind 10 seconds",
              iconSize: 60,
              padding: EdgeInsets.all(0),
              onPressed: () {
                hopper.skipBack();
              },
            ),
            if (!hopper.playing)
              IconButton(
                icon: const Icon(Icons.play_circle_fill),
                tooltip: "Play",
                iconSize: 80,
                padding: EdgeInsets.all(0),
                color: Theme.of(context).colorScheme.onBackground,
                onPressed: () {
                  hopper.play();
                },
              ),
            if (hopper.playing)
              IconButton(
                icon: const Icon(Icons.pause_circle_filled),
                tooltip: "Play",
                iconSize: 80,
                padding: EdgeInsets.all(0),
                color: Theme.of(context).colorScheme.onBackground,
                onPressed: () {
                  hopper.pause();
                },
              ),
            IconButton(
              icon: const Icon(Icons.forward_10),
              tooltip: "Skip 10 seconds",
              iconSize: 60,
              padding: EdgeInsets.all(0),
              onPressed: () {
                hopper.skipForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              tooltip: "Finish Article",
              iconSize: 60,
              padding: EdgeInsets.all(0),
              onPressed: () {
                hopper.advanceHopper();
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text('Finish Article')));
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
