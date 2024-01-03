import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh_history.model.dart';
import 'package:kweshtion_basic/services/history.service.dart';
import 'package:kweshtion_basic/utils/debounce.dart';

class HistoryViewModel extends ChangeNotifier {
  TextEditingController textEditingController;
  String lastSearch = "";
  final List<KweshHistoryModel> _historyCreated = [];
  List<KweshHistoryModel> _historyAnswered = [];
  bool isLoading = false;
  bool isLoaded = false;
  final HistoryService _historyService = HistoryService.injected();
  Debouncer debouncer = Debouncer(milliseconds: 300);

  void onSearch() async {
    debouncer.cancel();
    if (lastSearch == textEditingController.text) return;
    lastSearch = textEditingController.text;

    isLoading = true;
    notifyListeners();
    // TODO Search in history
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  void loadHistory() async {
    isLoading = true;
    notifyListeners();

    // TODO Load user history
    _historyAnswered = await _historyService.loadDefaultRecomendation();
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    isLoaded = true;
    notifyListeners();
  }

  HistoryViewModel({required this.textEditingController}) {
    loadHistory();
    textEditingController.addListener(
      () => debouncer.run(() => onSearch()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.removeListener(onSearch);
  }

  factory HistoryViewModel.init(TextEditingController controller) {
    return HistoryViewModel(
      textEditingController: controller,
    );
  }

  List<KweshHistoryModel> get historyCreated => _historyCreated;
  List<KweshHistoryModel> get historyAnswered => _historyAnswered;
}
