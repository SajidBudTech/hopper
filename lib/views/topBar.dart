import 'dart:io';

import 'package:flutter/material.dart';

class TopBar extends AppBar {
  TopBar({
    Key key,
    this.name,
    this.context,
  }) : super(
            key: key,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Audio-Hopper-Logo-White_1.png',
                  width: 50,
                  height: 40,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  "audio",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  "hopper",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
            textTheme: Theme.of(context).textTheme,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.account_circle),
                tooltip: "Account Settings",
                onPressed: () =>
                    {DefaultTabController.of(context).animateTo(3)},
              )
            ]);

  final String name;
  BuildContext context;
}
