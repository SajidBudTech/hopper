import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/hopperModel.dart';
import '../models/storyItem.dart';
import '../models/hopperItem.dart';
import 'components/emptyHopper.dart';
import 'components/storyHopperCard.dart';

class TempHopper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TempHopperState();
  }
}

class _TempHopperState extends State<TempHopper> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
       child: Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(
             child:FlatButton(
               padding: EdgeInsets.all(16),
               child: Text("Hello \n\nWe are good to go!",style: TextStyle(color: Colors.white),),
               color: Colors.black,
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => MyHomePage()),
                 );
               },
             )
           )
         ],
       ),
    )
    );
  }
}
