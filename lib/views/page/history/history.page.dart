import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/history.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/history/history_button.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryViewModel>(
        create: (context) =>
            HistoryViewModel.init(_textEditingController, _refreshIndicatorKey),
        builder: (context, _) {
          final vm = Provider.of<HistoryViewModel>(context);
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const TabBar(
                  tabs: [
                    Tab(text: "Answered"),
                    Tab(text: "Unanswered"),
                  ],
                ),
                bottom: // Search bar
                    PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: _textEditingController,
                      onSubmitted: (value) => vm.onSearch(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        filled: true,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.25),
                        prefixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
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
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          if (!vm.isLoaded) {
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
                          if (vm.historyAnswered.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Aucune donnée trouvé pour votre recherche",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return HistoryButtonWidget(
                              history: vm.historyAnswered[index]);
                        },
                        itemCount: vm.isLoaded
                            ? vm.historyAnswered.isEmpty
                                ? 1
                                : vm.historyAnswered.length
                            : 1,
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          if (!vm.isLoaded) {
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
                          if (vm.historyAnswered.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Aucune donnée trouvé pour votre recherche",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return HistoryButtonWidget(
                              history: vm.historyAnswered[index]);
                        },
                        itemCount: vm.isLoaded
                            ? vm.historyAnswered.isEmpty
                                ? 1
                                : vm.historyAnswered.length
                            : 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
