import 'dart:io';

import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  BottomNavButton({
    this.icon,
    this.label,
    this.action,
  });
  IconData icon;
  String label;
  var action;
  @override
  Widget build(BuildContext context) {
    /*return Expanded(
      child: Container(
        margin: EdgeInsets.all(3.0),
        child: Material(
          //width: 20,
          //height: 100,
          color: Theme.of(context).buttonColor,
          //margin: EdgeInsets.all(3.0),
          //child: Container(
          //onTap: () => print("onTap"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                this.icon,
                size: 60,
                color: Colors.black87,
              ),
              Text(
                "${this.label}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          //),
        ),
      ),
    );*/

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            left: 3.0,
            right: 3.0,
            top: 3.0,
            bottom: Platform.isIOS ? 23.0 : 3.0),
        child: Material(
          color: Theme.of(context).colorScheme.secondary,
          //width: 20,
          //height: 100,
          //color: Theme.of(context).buttonColor,
          //margin: EdgeInsets.all(3.0),
          child: InkWell(
            onTap: this.action,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  this.icon,
                  size: 60,
                ),
                Text(
                  "${this.label}",
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
