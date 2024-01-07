import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/search.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/search/search_button.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SearchViewModel.init(_textEditingController, _scrollController),
      builder: (context, _) {
        final vm = Provider.of<SearchViewModel>(context);
        return Scaffold(
          appBar: AppBar(
            title: // Search bar
                Row(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    controller: _textEditingController,
                    onSubmitted: (e) => vm.onSearch(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Search",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => vm.openOption(context),
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
            ),
            child: RefreshIndicator(
                key: _refreshIndicatorKey,
                color: Theme.of(context).indicatorColor,
                onRefresh: () async {
                  await vm.onRefresh();
                },
                child: ListView.builder(
                  controller: vm.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: (!vm.isLoaded
                          ? 1
                          : vm.searchData.isEmpty
                              ? 1
                              : vm.searchData.length) +
                      (vm.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (vm.isLoading && index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Theme.of(context).indicatorColor,
                            ),
                          ],
                        ),
                      );
                    }
                    if (!vm.isLoaded) {
                      return index == 0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                ],
                              ),
                            )
                          : null;
                    }

                    if (vm.searchData.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Aucune donnée trouvé pour votre recherche",
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ElevatedButton(
                              onPressed: () => vm.createCategory(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade700,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                "Crée la catégory ${vm.lastSearch}",
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return SearchButtonWidget(
                      search: vm.searchData[vm.isLoading ? index - 1 : index],
                    );
                  },
                )),
          ),
        );
      },
    );
  }
}
