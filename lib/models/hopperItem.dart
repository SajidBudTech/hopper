import './storyItem.dart';

class HopperItem {
  // Data of the story itself
  StoryItem story;
  // The current read position of the story for the user, as a value between 0 and 1
  double readPosition = 0.0;
  // Whether or not story has finished playing or been marked as done by the user
  bool finished = false;

  HopperItem({this.story, this.readPosition = 0.0, this.finished = false}) {
    print("creating HopperItem");
  }

  double timeRemaining() {
    return story.duration * (1 - readPosition);
  }
}
