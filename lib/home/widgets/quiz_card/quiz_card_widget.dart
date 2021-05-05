import 'package:flutter/material.dart';
import 'package:flutter_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import '../../../core/app_colors.dart';
import '../../../core/core.dart';

class QuizCardWidget extends StatelessWidget {
  final String title, completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    required this.title,
    required this.onTap,
    required this.completed,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(AppImages.blocks),
              height: 40,
              width: 40,
            ),
            SizedBox(height: 20),
            Text(
              this.title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    this.completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: this.percent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
