import 'package:flutter/material.dart';

class ThemeViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          /*Text(
            "Headline 1 Text Example",
            style: Theme.of(context).textTheme.headline1,
          ),*/
          Text(
            "Headline 2 Text Example",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "Headline 3 Text Example",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "Headline 4 Text Example",
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "Headline 5 Text Example",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Headline 6 Text Example",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            "Subtitle 1 Text Example",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            "Subtitle 2 Text Example",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            "Body Text 1 Text Example",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Body Text 2 Text Example",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            "Caption Text Example",
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            "Overline Text Example",
            style: Theme.of(context).textTheme.overline,
          ),
          Text(
            "Button Text Example",
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
    ));
  }
}
