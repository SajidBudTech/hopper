import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

import './hopperItem.dart';
import 'storyItem.dart';

class HopperModel extends ChangeNotifier {
  List<HopperItem> currentHopper = [];
  List<HopperItem> history = [];

  AudioPlayer audioPlayer;
  AudioCache audioCache;
  bool playing = false;
  int skipTime = 10 * 1000; //Milliseconds to skip when skipping forward/back
  int duration = 1;

  HopperModel() {
    _initAudio();
  }

  void _initAudio() {
    print("Audio Init");
    audioPlayer = AudioPlayer(playerId: "reader");
    //AudioPlayer.logEnabled = true;
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onAudioPositionChanged.listen((event) {
      double percent = 0;
      if (duration != 0) {
        percent = event.inMilliseconds / duration;
      } else {
        //print("Duration is 0");
        findDuration();
      }
      updateProgress(percent);
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      print("story complete.");
      advanceHopper();
    });
  }

  void findDuration() async {
    duration = await audioPlayer.getDuration();
  }

  void updateProgress(double percent) {
    if (getCurrent() != null) {
      getCurrent().readPosition = percent;
    }
  }

  /// Audio Control Functions
  void play() async {
    if (isEmpty()) return;
    if (playing) {
      pause();
    }
    print("playing ${getCurrent().story.fileAddress}");
    double position = getCurrent().readPosition;
    audioCache.play(getCurrent().story.fileAddress);
    duration = await audioPlayer.getDuration();
    print("duration $duration. position $position");
    if (position != 0) {
      print("resuming partially played story. Position ${position * 100}%");
      int milliDuration = duration;
      int milliPosition = (milliDuration * position).floor();
      print("milliposition $milliPosition");
      await audioPlayer.seek(Duration(milliseconds: milliPosition));
      updateProgress(position);
    }
    playing = true;
    notifyListeners();
  }

  void pause() {
    if (!playing) {
      play();
    }
    audioPlayer.pause();
    playing = false;
    notifyListeners();
  }

  void skipBack() async {
    int position = await audioPlayer.getCurrentPosition();
    int newPosition = position > skipTime ? position - skipTime : 0;
    audioPlayer.seek(Duration(milliseconds: newPosition));
    notifyListeners();
  }

  void skipForward() async {
    int duration = await audioPlayer.getDuration();
    int position = await audioPlayer.getCurrentPosition();
    int newPosition =
        position + skipTime < duration ? position + skipTime : duration;
    audioPlayer.seek(Duration(milliseconds: newPosition));
    notifyListeners();
  }

  void restart() {
    audioPlayer.seek(Duration());
    updateProgress(0);
    notifyListeners();
  }

  /// Utility functions
  bool isEmpty() {
    return currentHopper.isEmpty;
  }

  double getRemainingTime() {
    double remaining = 0.0;
    for (HopperItem entry in currentHopper) {
      if (!entry.finished) {
        remaining += entry.timeRemaining();
      }
    }
    return remaining;
  }

  /// Hopper Control Functions

  bool hopperContains(StoryItem story) {
    var element = currentHopper.firstWhere(
        (element) => element.story.storyId == story.storyId,
        orElse: () => null);
    return element != null;
  }

  void addStoryToHopperAndPlay(StoryItem story) {
    if (hopperContains(story)) return;
    HopperItem newHopperItem = HopperItem(story: story);
    currentHopper.insert(0, newHopperItem);
    //Play story
    audioPlayer.stop();
    play();
    notifyListeners();
  }

  void addStoryToHopperQueue(StoryItem story) {
    if (hopperContains(story)) return;
    HopperItem newHopperItem = HopperItem(story: story);
    currentHopper.add(newHopperItem);
    audioCache.load(story.fileAddress);
    notifyListeners();
  }

  /// Moves the element at index [i] by [movement] places backwards or forwards
  /// Negative [movement] means moving the element earlier in the list. Positive, later
  /// [movement] should be no less than the absolute value of [i],
  /// and no greater than [_hopper.length] - i
  void moveHopperItem(int index, int movement) {
    int newIndex = index + movement;
    assert(newIndex <= currentHopper.length);
    assert(newIndex >= 0);
    HopperItem entry = currentHopper[index];
    currentHopper.removeAt(index);
    currentHopper.insert(newIndex, entry);
    notifyListeners();
  }

  void removeHopperEntry(int index) {
    if (index == 0) {
      advanceHopper();
    } else {
      markStoryAsFinishedAndRemove(index);
    }
    notifyListeners();
  }

  HopperItem getCurrent() {
    if (currentHopper.length == 0) {
      return null;
    }
    return currentHopper[0];
  }

  void markStoryAsFinishedAndRemove(int index) {
    assert(index < currentHopper.length);
    var item = currentHopper[index];
    //Only Mark as finished and save in history if any of it has been listened to
    if (item.readPosition > 0) {
      item.finished = true;
      history.insert(0, item);
    }
    currentHopper.removeAt(index);
  }

  void advanceHopper() {
    markStoryAsFinishedAndRemove(0);
    // Stop playing *this* audio no matter what
    audioPlayer.stop();
    // if it was in playing state, then call Play
    // which will play the new article instead
    if (playing) {
      play();
    }
    notifyListeners();
  }
}
