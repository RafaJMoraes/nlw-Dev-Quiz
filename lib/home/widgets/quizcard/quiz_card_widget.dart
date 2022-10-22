import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String completed;
  final String title;
  final double percentage;
  final VoidCallback onTap;
  final String image;

  const QuizCardWidget(
      {Key? key,
      required this.completed,
      required this.title,
      required this.percentage,
      required this.onTap,
      required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset("assets/images/$image.png"),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                    flex: 8, child: ProgressIndicatorWidget(value: percentage))
              ],
            )
          ],
        ),
      ),
    );
  }
}
