import 'package:flutter/material.dart';
import 'package:kweshtion_basic/views/widgets/animated_count.widget.dart';

class KweshAnswerWidget extends StatelessWidget {
  Function? onClick;
  final double height = 40;
  final bool isAnswered;
  final bool isTheAnswer;
  final bool isTheMaxVoted;
  final double widthFactor;
  final double answerWidth;
  final int nbVotes;
  final String answer;
  final bool withCheckmark;
  KweshAnswerWidget({
    Key? key,
    this.onClick,
    required this.isAnswered,
    required this.isTheAnswer,
    required this.isTheMaxVoted,
    required this.answer,
    required this.answerWidth,
    required this.nbVotes,
    required this.widthFactor,
    required this.withCheckmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: onClick == null
            ? null
            : () {
                onClick!();
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
          // decoration: !isAnswered && isSelected
          //     ? BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(
          //           color: Colors.amber,
          //           width: 0.5,
          //         ),
          //       )
          //     : null,
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
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: isAnswered,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: SizedBox(
                            width: answerWidth.toDouble(),
                            child: Text.rich(
                              textAlign: TextAlign.right,
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: AnimatedCount(
                                      count: isAnswered ? nbVotes : 0,
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
                      // if (!isAnswered && !isSelected)
                      //   Container(
                      //     height: 18,
                      //     width: 18,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(
                      //         color: Theme.of(context).colorScheme.secondary,
                      //         width: 2,
                      //       ),
                      //     ),
                      //   ),

                      if (!isAnswered) const SizedBox(width: 8.0),
                      Flexible(
                        child: Text(
                          answer,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      if (isTheAnswer) const SizedBox(width: 12.0),
                      if (isTheAnswer && withCheckmark)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.amber,
                          size: 18,
                        ),
                      // TODO Make percent appear
                      // if (isAnswered)
                      //   Expanded(
                      //     child: Text(
                      //       "${(widthFactor * 100).toStringAsPrecision(3)}%",
                      //       textAlign: TextAlign.right,
                      //     ),
                      //   )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
