import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnsers_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AwnsersModel awnsersModel;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AnswerWidget(
      {Key? key,
      required this.awnsersModel,
      this.isSelected = false,
      required this.onTap,
      required this.disabled})
      : super(key: key);
  Color get _selectedColorRight =>
      awnsersModel.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>
      awnsersModel.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight =>
      awnsersModel.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight =>
      awnsersModel.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => awnsersModel.isRight
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight =>
      awnsersModel.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: () {
          onTap(awnsersModel.isRight);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                  color: isSelected
                      ? _selectedBorderCardRight
                      : AppColors.border))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(awnsersModel.title,
                      style: isSelected
                          ? _selectedTextStyleRight
                          : AppTextStyles.body)),
              Container(
                decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border))),
                height: 24,
                width: 24,
                child: isSelected
                    ? Icon(
                        isSelected ? _selectedIconRight : Icons.check,
                        size: 16,
                        color: AppColors.white,
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
