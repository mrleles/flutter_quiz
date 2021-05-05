import 'package:flutter/material.dart';
import 'package:flutter_quiz/core/app_gradients.dart';
import 'package:flutter_quiz/core/core.dart';
import 'package:flutter_quiz/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
    return Container(
      //o cara usou um Scaffold, não sei pra q
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
