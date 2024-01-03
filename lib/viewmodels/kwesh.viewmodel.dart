import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/services/kwesh.service.dart';
import 'package:kweshtion_basic/views/widgets/kwesh.details.widget.dart';

class KweshViewModel extends ChangeNotifier {
  KweshModel kwesh;
  final PageController pageController;
  final KweshService _kweshService = KweshService.injected();
  final int pageIndex;

  KweshViewModel(
      {required this.kwesh,
      required this.pageController,
      required this.pageIndex}) {
    getKwesh().then((value) => notifyListeners());
  }

  factory KweshViewModel.init(
      KweshModel kwesh, PageController controller, int pageIndex) {
    return KweshViewModel(
      kwesh: kwesh,
      pageController: controller,
      pageIndex: pageIndex,
    );
  }

  Future<void> getKwesh() async {
    kwesh = await _kweshService.getKwesh(kwesh.id);
    notifyListeners();
  }

  Future<void> answerKwesh(String answerId) async {
    await _kweshService.answerKwesh(kwesh.id, answerId);
    // Add one vote to the answer
    final answerIndex =
        kwesh.answers.indexWhere((element) => element.id == answerId);

    kwesh = kwesh.copyWith(
      answers: [
        ...kwesh.answers.sublist(0, answerIndex),
        kwesh.answers[answerIndex]
            .copyWith(nbVotes: kwesh.answers[answerIndex].nbVotes + 1),
        ...kwesh.answers.sublist(answerIndex + 1),
      ],
      answer: answerId,
    );

    notifyListeners();
  }

  Future<void> skipKwesh() async {
    await _kweshService.skipKwesh(kwesh.id);
    // Add one vote to the answer
    kwesh = kwesh.copyWith(skipped: true);
    notifyListeners();
  }

  void resetAnswer() {
    kwesh = kwesh.copyWith(answer: null);
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

  get maxVote => kwesh.answers.fold(
        0,
        (previousValue, element) =>
            previousValue > element.nbVotes ? previousValue : element.nbVotes,
      );

  String? get answer => kwesh.answer;

  void showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => KweshDetailsWidget(
        kweshViewModel: this,
      ),
    );
  }

  void reportKwesh() {
    // Scroll to the next page
    pageController.animateToPage(
      pageIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void hideAuthorKwesh() {
    // Scroll to the next page
    pageController.animateToPage(
      pageIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void likeCategory() {
    // TODO LIKE
  }
}
