import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/screenmain.dart';
import 'package:stopwatch/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenSplash(),
    );
  }
}