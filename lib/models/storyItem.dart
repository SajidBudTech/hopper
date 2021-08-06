class StoryItem {
  // Unique ID of the story  in AudioHopper
  int storyId;
  // Headline
  String headline = "";
  // Intro text for previews
  String subhead = "";
  // Filename - External URL to the mp3 file
  String fileAddress;
  // URL to the full article on the web
  String url;
  // URL to the article image for social media sharing
  String imageUrl;
  // Name of the publishing outlet
  String publication;
  // AudioHopper ID of the publishing outlet
  int publicationId;
  // Name of the author
  String author;
  // AudioHopper ID of the author
  int authorId;
  // Name of the narrator
  String narrator;
  // AudioHopper ID of the narrator
  int narratorId;
  // Publication date of the article
  DateTime date;
  // Duration of the nuration in minutes
  double duration;

  StoryItem({
    this.storyId,
    this.headline,
    this.subhead,
    this.url,
    this.fileAddress,
    this.imageUrl,
    this.publication,
    this.publicationId,
    this.author,
    this.authorId,
    this.narrator,
    this.narratorId,
    this.date,
    this.duration,
  });

  String getFilename() {
    return "";
  }

  String dateToString() {
    if (date == null) {
      return "No Date";
    } else {
      int shortYear = date.year % 1000;
      return "${date.month}/${date.day}/$shortYear";
    }
  }
}
