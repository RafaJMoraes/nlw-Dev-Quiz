import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/questionIndicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  final List<QuestionModel> questions;
  final String titleQuiz;

  const ChallengePage(
      {Key? key, required this.questions, required this.titleQuiz})
      : super(key: key);
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      this.setState(() {
        controller.currentPage = pageController.page!.toInt() + 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(98),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context)),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentoPage: value,
                          lengthQuestions: widget.questions.length,
                        )),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(onSelected: onSelected, question: e))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                                label: 'Pular', onTap: nextPage)),
                      if (value == widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resultpage(
                                        result: controller.qtdAnswersRigth,
                                        length: widget.questions.length,
                                        title: widget.titleQuiz,
                                      ))),
                        )),
                    ],
                  )),
        ),
      ),
    );
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 50),
          curve: Curves.fastLinearToSlowEaseIn);
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnswersRigth++;
    }
    nextPage();
  }
}
