


import 'package:flutter_bottom_nav/screens/dashboard_screen.dart';


FileIntent fileIntent;


class FileIntent{
  Screen startScreen;

  FileIntent({this.startScreen});

  static Future<void> init() async {
    try {
      fileIntent = new FileIntent(
        startScreen: Screen.home,
      );
    }
    catch(exception) {
      fileIntent = new FileIntent(
        startScreen: Screen.home,
      );
    }
  }


}