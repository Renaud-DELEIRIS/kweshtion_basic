import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/animated_count.widget.dart';
import 'package:kweshtion_basic/views/widgets/category_display.widget.dart';
import 'package:kweshtion_basic/views/widgets/kwesh/kwesh_answer.widget.dart';
import 'package:kweshtion_basic/views/widgets/tag.widget.dart';
import 'package:kweshtion_basic/views/widgets/user_display.widget.dart';

const height = 40.0;

class KweshWidget extends StatelessWidget {
  final KweshViewModel kweshViewModel;

  const KweshWidget({Key? key, required this.kweshViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDisplayWidget(user: kweshViewModel.kwesh.author),
                SizedBox(height: kweshViewModel.kwesh.category != null ? 5 : 0),
                if (kweshViewModel.kwesh.category != null)
                  CategoryDisplayWidget(
                    category: kweshViewModel.kwesh.category!,
                  ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    kweshViewModel.kwesh.question,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TagWidget(tag: kweshViewModel.kwesh.tag),
                IconButton(
                  onPressed: () => kweshViewModel.showDetails(context),
                  icon: const Icon(Icons.more_horiz),
                )
              ],
            ),

            const SizedBox(height: 10),

            // Total vote
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 13,
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: AnimatedCount(
                      count: kweshViewModel.totalVotes,
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " vote${kweshViewModel.totalVotes > 1 ? "s" : ""}",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            // List of answers
            ...kweshViewModel.kwesh.answers.map((answer) {
              // or skipped
              bool isAnswered = kweshViewModel.answer != null ||
                  kweshViewModel.kwesh.skipped == true;
              bool isTheAnswer = kweshViewModel.answer == answer.id;
              bool isTheMaxVoted = kweshViewModel.maxVote == answer.nbVotes;
              // bool isMaxVoted = kweshViewModel.kwesh.answers

              double widthFactor = isAnswered
                  ? answer.nbVotes /
                      (kweshViewModel.totalVotes == 0
                          ? 1
                          : kweshViewModel.totalVotes)
                  : 0.0;

              int answerWidth = kweshViewModel.maxAnswerWidth * 12;

              return KweshAnswerWidget(
                isAnswered: isAnswered,
                isTheAnswer: isTheAnswer,
                isTheMaxVoted: isTheMaxVoted,
                answer: answer.answer,
                withCheckmark: true,
                answerWidth: answerWidth.toDouble(),
                nbVotes: answer.nbVotes,
                widthFactor: widthFactor,
                onClick: () {
                  if (isAnswered) {
                    kweshViewModel.resetAnswer();
                  } else {
                    kweshViewModel.answerKwesh(answer.id);
                  }
                },
              );
            }).toList(),
            const SizedBox(
              height: 5,
            ),
            // Skip button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: kweshViewModel.answer != null ||
                          kweshViewModel.kwesh.skipped == true
                      ? null
                      : kweshViewModel.skipKwesh,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ],
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
