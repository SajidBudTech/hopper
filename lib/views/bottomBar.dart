import 'dart:io';

import 'package:flutter/material.dart';

import 'components/bottomNavButton.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: Platform.isIOS ? 120 : 100,
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          children: [
            BottomNavButton(
              icon: Icons.library_books_outlined,
              label: "Browse",
              action: () => {DefaultTabController.of(context).animateTo(0)},
            ),
            BottomNavButton(
              icon: Icons.playlist_play,
              label: "Hopper",
              action: () => {DefaultTabController.of(context).animateTo(1)},
            ),
            BottomNavButton(
              icon: Icons.play_arrow,
              label: "Playing",
              action: () => {DefaultTabController.of(context).animateTo(2)},
            ),
          ],
        ),
      ),
    );
  }
}
