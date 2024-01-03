import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/search.model.dart';
import 'package:kweshtion_basic/services/search.service.dart';
import 'package:kweshtion_basic/utils/debounce.dart';

class SearchViewModel extends ChangeNotifier {
  TextEditingController textEditingController;
  ScrollController scrollController;
  String lastSearch = "";
  List<SearchModel> _searchData = [];
  bool isLoading = false;
  bool isLoaded = false;
  final SearchService _searchService = SearchService.injected();
  Debouncer debouncer = Debouncer(milliseconds: 300);

  void onSearch() async {
    debouncer.cancel();
    if (lastSearch == textEditingController.text) return;
    lastSearch = textEditingController.text;

    isLoading = true;
    notifyListeners();
    _searchData = await _searchService.search(textEditingController.text);
    await Future.delayed(const Duration(seconds: 1));
    scrollController.jumpTo(0);
    isLoading = false;
    notifyListeners();
  }

  void loadDefaultRecomendation() async {
    isLoading = true;
    notifyListeners();

    _searchData = await _searchService.loadDefaultRecomendation();
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    isLoaded = true;
    notifyListeners();
  }

  SearchViewModel(
      {required this.textEditingController, required this.scrollController}) {
    loadDefaultRecomendation();
    textEditingController.addListener(
      () => debouncer.run(() => onSearch()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.removeListener(onSearch);
  }

  factory SearchViewModel.init(
      TextEditingController controller, ScrollController scrollController) {
    return SearchViewModel(
      textEditingController: controller,
      scrollController: scrollController,
    );
  }

  List<SearchModel> get searchData => _searchData;

  // Filter only hot topics from search data
  bool get hasHotTopics => _searchData.any((element) => element.isHot);
}
