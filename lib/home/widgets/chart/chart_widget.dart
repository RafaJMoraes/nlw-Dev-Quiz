import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({Key? key, required this.percent}) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0.0, end: widget.percent)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return Stack(
              children: [
                Center(
                  child: Container(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        value: _animation.value,
                        backgroundColor: AppColors.chartSecondary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.chartPrimary),
                      )),
                ),
                Center(
                    child: Text(
                  '${(_animation.value * 100).toStringAsFixed(0)}%',
                  style: AppTextStyles.heading,
                ))
              ],
            );
          }),
    );
  }
}
