import 'package:flutter/material.dart';
import 'package:stopwatch/screenmain.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    loadHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/logo-3-larger.png',
            height: 100,
            width: 100,
          )),
          const Text(
            'StOpWaTcH',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }

  Future loadHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const ScreenHome()));
  }
}
