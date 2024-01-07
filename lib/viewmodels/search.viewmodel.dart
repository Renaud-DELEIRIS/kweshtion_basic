import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_select/flutter_native_select.dart';
import 'package:kweshtion_basic/api/models/response/search.model.dart';
import 'package:kweshtion_basic/config/app_router.dart';
import 'package:kweshtion_basic/services/search.service.dart';
import 'package:kweshtion_basic/utils/debounce.dart';
import 'package:kweshtion_basic/views/widgets/search/search_option.widget.dart';

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
    // await _searchService.search(textEditingController.text);
    await Future.delayed(const Duration(seconds: 1));
    _searchData = [];
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

  Future<void> onRefresh() async {
    _searchData = await _searchService.loadDefaultRecomendation();
    await Future.delayed(const Duration(seconds: 1));
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
    debouncer.cancel();
  }

  factory SearchViewModel.init(
      TextEditingController controller, ScrollController scrollController) {
    return SearchViewModel(
      textEditingController: controller,
      scrollController: scrollController,
    );
  }

  void createCategory(BuildContext context) {
    final String category = lastSearch;
    AutoRouter.of(context).push(CreateCategoryRoute(name: category));
  }

  List<SearchModel> get searchData => _searchData;

  // Filter only hot topics from search data
  // Future<String> changeTag() async {
  //   // Select
  //   final selectedItem = await FlutterNativeSelect.openSelect(
  //     items: [
  //       const NativeSelectItem(value: 'item0', label: 'Item 0'),
  //       const NativeSelectItem(value: 'item1', label: 'Item 1'),
  //       const NativeSelectItem(value: 'item2', label: 'Item 2'),
  //       NativeSelectItem(
  //         value: 'disabled1',
  //         label: 'Disabled item 1',
  //         disabled: true,
  //         color: Colors.red[900],
  //       ),
  //       const NativeSelectItem(
  //         value: 'disabled2',
  //         label: 'Disabled item 2',
  //         disabled: true,
  //       ),
  //       const NativeSelectItem(
  //         value: 'disabled3',
  //         label: 'Disabled item 3',
  //         disabled: true,
  //       ),
  //       NativeSelectItem(
  //         value: 'blue',
  //         label: 'Blue item',
  //         color: Colors.blue[900],
  //       ),
  //     ],
  //   );

  //   if (selectedItem == null) {
  //     print('User cleared or dismissed the dialog');
  //   } else {
  //     print('User selected: $selectedItem');
  //   }
  //   // TODO RESEARCH
  //   notifyListeners();

  //   return '';
  // }

  void openOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => SearchOptionWidget(searchViewModel: this));
  }
}
