


import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/screens/test_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestScreen()),
                );
              },
              child: Text(
                "Home Screen"
              ),
            ),
          ),
        ),
      ),
    );
  }

}