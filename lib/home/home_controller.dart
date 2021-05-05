import 'package:flutter/material.dart';
import 'package:flutter_quiz/home/home_repository.dart';
import 'package:flutter_quiz/home/home_state.dart';
import 'package:flutter_quiz/shared/models/quiz_model.dart';
import 'package:flutter_quiz/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();
  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  void getUser() async {
    state = (HomeState.loading);
    user = await repository.getUser();
    //state = (HomeState.success);
  }

  void getQuizzes() async {
    state = (HomeState.loading);
    quizzes = await repository.getQuizzes();
    Future.delayed(Duration(seconds: 1));
    state = (HomeState.success);
  }
}
