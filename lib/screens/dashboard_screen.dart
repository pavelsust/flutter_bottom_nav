
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/screens/favourite_screen.dart';
import 'package:flutter_bottom_nav/screens/home_screen.dart';
import 'package:flutter_bottom_nav/screens/second_screen.dart';
import 'package:flutter_bottom_nav/utils/file_intent.dart';

enum Screen {
  home,
  secondhome,
  favourite
}

class DashboardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreen();
  }

}

class _DashboardScreen extends State<DashboardScreen>  with TickerProviderStateMixin , WidgetsBindingObserver {

  int index = fileIntent.startScreen.index;

  List<GlobalKey<NavigatorState>> navigatorKeys = <GlobalKey<NavigatorState>>[
    new GlobalKey<NavigatorState>(),
    new GlobalKey<NavigatorState>(),
    new GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<bool> didPopRoute() async{
    if (this.navigatorKeys[this.index].currentState.canPop()) {
      this.navigatorKeys[this.index].currentState.pop();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = <Widget>[
      Navigator(
        key: this.navigatorKeys[0],
        initialRoute: "home",
        onGenerateRoute: (RouteSettings routeSettings){
          Route route;
          if(routeSettings.name == "home"){
            route = MaterialPageRoute(builder: (_) => HomeScreen());
          }
          return route;
        },
      ),
      Navigator(
        key: this.navigatorKeys[1],
        initialRoute: "second",
        onGenerateRoute: (RouteSettings routeSettings){
          Route route;
          if(routeSettings.name == "second"){
            route = MaterialPageRoute(builder: (_) => SecondScreen());
          }
          return route;
        },
      ),

      Navigator(
        key: this.navigatorKeys[2],
        initialRoute: "fav",
        onGenerateRoute: (RouteSettings routeSettings){
          Route route;
          if(routeSettings.name == "fav"){
            route = MaterialPageRoute(builder: (_) => FavouriteScreen());
          }
          return route;
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageTransitionSwitcher(
          child: screens[this.index],
          duration: Duration(microseconds: 400),
          transitionBuilder: (child , animation , secondaryAnimation) => FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.index,
          onTap: (int index) => this.setState(() => this.index = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.album),
              label: "Home",
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: "Second Home",
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: "Favourite",
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ),
          ],
        ),
        ),
    );
  }

}