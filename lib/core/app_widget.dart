import 'package:flutter/material.dart';
import 'package:flutter_quiz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: "FlutterQuiz",
      home: SplashPage(),
    );
  }
}
