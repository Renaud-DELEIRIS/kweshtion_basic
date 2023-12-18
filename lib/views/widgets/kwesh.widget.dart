import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/animated_count.widget.dart';
import 'package:kweshtion_basic/views/widgets/category_display.widget.dart';
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
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            TagWidget(tag: kweshViewModel.kwesh.tag),

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
              bool isAnswered = kweshViewModel.answer != null;
              bool isTheAnswer = kweshViewModel.answer == answer.id;
              bool isSelected = kweshViewModel.selectedAnswer == answer.id;
              bool isTheMaxVoted = kweshViewModel.maxVote == answer.nbVotes;
              // bool isMaxVoted = kweshViewModel.kwesh.answers

              double widthFactor = isAnswered
                  ? answer.nbVotes /
                      (kweshViewModel.totalVotes == 0
                          ? 1
                          : kweshViewModel.totalVotes)
                  : 0.0;

              int answerWidth = kweshViewModel.maxAnswerWidth * 12;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextButton(
                  onPressed: () {
                    if (!isAnswered) {
                      kweshViewModel.setSelectedAnswer(answer.id);
                    } else {
                      kweshViewModel.resetAnswer();
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  child: SizedBox(
                    height: height,
                    child: Stack(
                      children: [
                        AnimatedFractionallySizedBox(
                          duration: const Duration(milliseconds: 500),
                          heightFactor: 1,
                          widthFactor: widthFactor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: isTheMaxVoted
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3)
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              crossAxisAlignment: isAnswered
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: isAnswered,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Container(
                                      width: answerWidth.toDouble(),
                                      child: Text.rich(
                                        textAlign: TextAlign.right,
                                        TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: AnimatedCount(
                                                count: isAnswered
                                                    ? answer.nbVotes
                                                    : 0,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!isAnswered && !isSelected)
                                  Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                if (!isAnswered && isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                if (!isAnswered) const SizedBox(width: 8.0),
                                Flexible(
                                  child: Text(
                                    answer.answer,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (isTheAnswer) const SizedBox(width: 12.0),
                                if (isTheAnswer)
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            SizedBox(
              height: 10,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: kweshViewModel.selectedAnswer != null &&
                          kweshViewModel.answer == null
                      ? () => kweshViewModel.answerKwesh()
                      : null,
                  child: Text("Vote"),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () => kweshViewModel.showDetails(context),
                  icon: Icon(Icons.more_horiz),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
