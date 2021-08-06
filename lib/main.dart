import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import 'views/tempory_view.dart';
import 'views/topBar.dart';
import 'views/storyList.dart';
import 'views/storyHopper.dart';
import 'views/themeViewer.dart';
import 'views/bottomBar.dart';
import 'views/nowplayingView.dart';
import 'models/hopperModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'cZAbtll0RXQBszCLGrnLuKAT2CaZsBE22m5yBqvn';
  final keyClientKey = 'b5Npkg9bMeVEEvuMyzHo42HR0NmSKajzFpLS96io';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  print("Initializing Parse SDK");
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  print("Parse SDK initialized. Running App");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color ah_black = Color(0xFF1A1A1A);
    const Color ah_white = Color(0xFFF2F2F2);
    const Color ah_green = Color(0xFF008080);
    const Color ah_green_light = Color(0xFF5F9F9F);
    const Color ah_blue = Color(0xFFA6DDEC);
    const Color ah_blue_bright = Color(0xFF29ABE2);
    const Color ah_red = Color(0xFFFF8A80);
    const Color ah_red_dark = Color(0xFFFD50000);

    return MaterialApp(
      title: 'Audio Hopper (Beta)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        //primarySwatch: Colors.deepOrange,
        primaryColor: ah_green,
        accentColor: ah_blue,
        backgroundColor: ah_white,

        //
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme(
          primary: ah_green,
          primaryVariant: ah_green_light,
          onPrimary: ah_white,
          secondary: ah_blue,
          secondaryVariant: ah_green, //ah_blue_bright,
          onSecondary: ah_green,
          background: ah_white,
          onBackground: ah_black, //ah_green, //ah_black,
          surface: ah_white,
          onSurface: ah_blue_bright, //ah_black,
          error: ah_red,
          onError: ah_red_dark,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          // headline1: TextStyle(),
          // headline2: TextStyle(),
          // headline3: TextStyle(),
          // headline4: TextStyle(),
          headline5: TextStyle(
            color: ah_black,
            fontSize: 21,
            fontWeight: FontWeight.w600,
            letterSpacing: .25,
          ),
          // headline6: TextStyle(),
          //caption: TextStyle(fontFamily: 'Times'),
          //button: TextStyle(fontFamily: 'Times'),

          subtitle1: TextStyle(
            color: ah_black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: .75,
          ),
          subtitle2: TextStyle(
            color: ah_black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: .75,
          ),

          bodyText1: TextStyle(
            color: ah_black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
          bodyText2: TextStyle(
            color: ah_black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
        ),
      ),
      home: TempHopper(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<HopperModel>(
              create: (context) => HopperModel()),
          //ChangeNotifierProvider<AudioModel>(create: (context) => AudioModel()),
        ],
        child: Scaffold(
          appBar: TopBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            name: widget.title,
            context: context,
          ),
          body: TabBarView(
            children: [
              //Make Sure this order matches 1-1 to taps in bottmBar.dart
              StoryList(),
              StoryHopper(),
              NowPlayingView(),
              //Text("Play screen"),
              //ThemeViewer(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
