import 'package:flutter/material.dart';
import 'package:flutter_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

import '../../core/core.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage, lenght;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.lenght,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questao $currentPage',
                style: AppTextStyles.body,
              ),
              Text(
                ' de $lenght',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: currentPage / lenght),
        ],
      ),
    );
  }
}
