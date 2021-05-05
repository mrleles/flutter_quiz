import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz/challenge/challenge_page.dart';
import 'package:flutter_quiz/core/app_colors.dart';
import 'package:flutter_quiz/home/home_controller.dart';
import 'package:flutter_quiz/home/home_state.dart';
import 'package:flutter_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_quiz/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          appBar: AppBarWidget(user: controller.user!),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    LevelButtonWidget(label: 'Médio'),
                    LevelButtonWidget(label: 'Difícil'),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes == null
                        ? [Text('problema')]
                        : controller.quizzes!
                            .map((e) => QuizCardWidget(
                                  title: e.title,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChallengePage(
                                                  questions: e.questions,
                                                  title: e.title,
                                                )));
                                  },
                                  percent:
                                      e.questionAnswered / e.questions.length,
                                  completed:
                                      '${e.questionAnswered}/${e.questions.length}',
                                ))
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
