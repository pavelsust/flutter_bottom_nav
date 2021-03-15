


import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Test Screen"
          ),
        ),
        body: Container(
          child: Text(
            "Test Screen"
          ),
        ),
      ),
    );
  }
}