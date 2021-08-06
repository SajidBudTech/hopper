import 'package:flutter/material.dart';

class EmptyHopper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              "Your Hopper is empty \n\n Click Browse to add more stories",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
