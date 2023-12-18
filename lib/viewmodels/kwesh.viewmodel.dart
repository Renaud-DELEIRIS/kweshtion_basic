import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/services/kwesh.service.dart';
import 'package:kweshtion_basic/views/widgets/kwesh.details.widget.dart';

class KweshViewModel extends ChangeNotifier {
  KweshModel kwesh;
  String? answer;
  String? _selectedAnswer;
  final KweshService _kweshService = KweshService.injected();

  KweshViewModel({required this.kwesh}) {
    getKwesh();
  }

  factory KweshViewModel.init(KweshModel kwesh) {
    return KweshViewModel(kwesh: kwesh);
  }

  Future<void> getKwesh() async {
    kwesh = await _kweshService.getKwesh(kwesh.id);
    notifyListeners();
  }

  void setSelectedAnswer(String answerId) {
    _selectedAnswer = answerId;
    notifyListeners();
  }

  Future<void> answerKwesh() async {
    await _kweshService.answerKwesh(kwesh.id, selectedAnswer!);
    // Add one vote to the answer
    final answerIndex =
        kwesh.answers.indexWhere((element) => element.id == selectedAnswer);

    kwesh = kwesh.copyWith(
      answers: [
        ...kwesh.answers.sublist(0, answerIndex),
        kwesh.answers[answerIndex]
            .copyWith(nbVotes: kwesh.answers[answerIndex].nbVotes + 1),
        ...kwesh.answers.sublist(answerIndex + 1),
      ],
    );

    answer = selectedAnswer;
    _selectedAnswer = null;
    notifyListeners();
  }

  void resetAnswer() {
    answer = null;
    _selectedAnswer = null;
    notifyListeners();
  }

  get totalVotes => kwesh.answers.fold(
        0,
        (previousValue, element) => previousValue + element.nbVotes,
      );

  // Is a calc of the number of digits in the max nb of votes answer
  get maxAnswerWidth => kwesh.answers.fold(
        0,
        (previousValue, element) =>
            previousValue > element.nbVotes.toString().length
                ? previousValue
                : element.nbVotes.toString().length,
      );

  get selectedAnswer => _selectedAnswer;

  get maxVote => kwesh.answers.fold(
        0,
        (previousValue, element) =>
            previousValue > element.nbVotes ? previousValue : element.nbVotes,
      );

  void showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => const KweshDetailsWidget(),
    );
  }
}
