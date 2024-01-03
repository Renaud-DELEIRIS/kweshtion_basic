import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh_history.model.dart';
import 'package:kweshtion_basic/views/widgets/kwesh/kwesh_answer.widget.dart';
import 'package:kweshtion_basic/views/widgets/tag.widget.dart';

class HistoryButtonWidget extends StatelessWidget {
  final KweshHistoryModel history;
  late AnswerModel answered = AnswerModel(id: "", answer: "", nbVotes: 0);
  late int totalVote = 0;
  late int newVote = 0;
  int answerWidth = 72;
  double widthFactor = 0;

  HistoryButtonWidget({Key? key, required this.history}) : super(key: key) {
    answered = history.kwesh.answers
        .firstWhere((element) => element.id == history.answerId);
    totalVote = history.kwesh.answers.fold(
      0,
      (previousValue, element) => previousValue + element.nbVotes,
    );
    newVote = totalVote - history.nbVoteOnAnswer;
    int maxAnswerWidth = history.kwesh.answers.fold(
      0,
      (previousValue, element) =>
          previousValue > element.nbVotes.toString().length
              ? previousValue
              : element.nbVotes.toString().length,
    );
    answerWidth = maxAnswerWidth * 12;
    widthFactor = answered.nbVotes / (totalVote == 0 ? 1 : totalVote);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: (TextButton(
        // onPressed: () => AutoRouter.of(context).navigateNamed(
        //     e.type == SearchType.user
        //         ? '/user/${e.targetId}'
        //         : '/category/${e.targetId}'),

        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.1),
          ),
        ),

        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TagWidget(tag: history.kwesh.tag),
                  const SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: Text(
                      history.kwesh.question,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 18,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  // Total vote
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: totalVote.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 11,
                          ),
                        ),
                        TextSpan(
                          text: " vote${totalVote > 1 ? "s" : ""}",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // TODO Fix is max voted
                  KweshAnswerWidget(
                    isAnswered: true,
                    isTheAnswer: true,
                    withCheckmark: false,
                    isTheMaxVoted: true,
                    answer: answered.answer,
                    answerWidth: answerWidth.toDouble(),
                    nbVotes: answered.nbVotes,
                    widthFactor: widthFactor,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: Colors.green,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$newVote nouveaux votes",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
      )),
    );
  }
}
