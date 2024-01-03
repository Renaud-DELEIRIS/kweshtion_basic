import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/history.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/history/history_button.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: ChangeNotifierProvider<HistoryViewModel>(
          create: (context) => HistoryViewModel.init(_textEditingController),
          builder: (context, child) {
            final vm = Provider.of<HistoryViewModel>(context);

            return Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Search bar
                    TextField(
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

                    const SizedBox(height: 10.0),

                    // Loader
                    if (vm.isLoading) const SizedBox(height: 10.0),

                    if (vm.isLoading)
                      CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),

                    // No data to display
                    if (vm.historyAnswered.isEmpty && vm.isLoaded)
                      Text(
                        "Aucune donnée trouvé pour votre recherche",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                    ...vm.historyAnswered
                        .map((e) => HistoryButtonWidget(history: e))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
