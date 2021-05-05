import 'package:flutter/material.dart';
import 'package:flutter_quiz/shared/models/question_model.dart';

import '../../../core/core.dart';
import '../../../shared/models/awnser_model.dart';
import '../awnser/awnser_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  QuizWidget({required this.question, required this.onSelected});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AwnserModel awnser(int index) => widget.question.awnsers[index];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.awnsers.length; i++)
              AwnserWidget(
                awnser: awnser(i),
                disabled: indexSelected != -1,
                isSelected: indexSelected == i,
                onTap: (value) {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(Duration(seconds: 1))
                      .then((_) => widget.onSelected(value));
                },
              ),
          ],
        ),
      ),
    );
  }
}
