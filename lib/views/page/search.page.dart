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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ChangeNotifierProvider<SearchViewModel>(
          create: (context) =>
              SearchViewModel.init(_textEditingController, _scrollController),
          builder: (context, child) {
            final vm = Provider.of<SearchViewModel>(context);

            return Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Search bar
                    TextField(
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

                    const SizedBox(height: 10.0),

                    // Loader
                    if (vm.isLoading) const SizedBox(height: 10.0),

                    if (vm.isLoading)
                      CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),

                    // No data to display
                    if (vm.searchData.isEmpty && vm.isLoaded)
                      Text(
                        "Aucune donnée trouvé pour votre recherche",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                    if (vm.hasHotTopics)
                      const Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Colors.amber,
                            size: 32,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Hot",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    // Hot topic
                    ...vm.searchData.map((e) {
                      return SearchButtonWidget(
                        search: e,
                      );
                    }),

                    if (vm.hasHotTopics)
                      Container(
                        height: 0.5,
                        color: Colors.grey,
                      ),

                    ...vm.searchData.map((e) {
                      return SearchButtonWidget(
                        search: e,
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
