import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Resultpage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const Resultpage(
      {Key? key,
      required this.title,
      required this.length,
      required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trofeu),
            Column(
              children: [
                Text(
                  result == 0 ? 'Tente Novamente' : 'Parabéns!',
                  style: result == 0
                      ? AppTextStyles.heading30
                      : AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(style: AppTextStyles.body, children: [
                    TextSpan(text: 'Você concluiu \n'),
                    TextSpan(text: '$title\n', style: AppTextStyles.bodyBold),
                    TextSpan(text: ' com $result de $length acertos'),
                  ]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                                'DevQuiz NLX5 - Flutter: Resultado do Quiz:' +
                                    ' $title\nObtive: ${((result / length) * 100).toStringAsFixed(0)}% de aproveitamento');
                          }),
                    )),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: NextButtonWidget.transparent(
                            label: 'Voltar ao inicio',
                            onTap: () => Navigator.pop(context)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
