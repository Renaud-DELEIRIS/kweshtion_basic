import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';
import 'package:kweshtion_basic/viewmodels/kwesh_list.viewmodel.dart';
import 'package:kweshtion_basic/views/page/create.page.dart';
import 'package:kweshtion_basic/views/widgets/category_display.widget.dart';
import 'package:kweshtion_basic/views/widgets/kwesh.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage(
      {Key? key,
      @QueryParam("startId") this.startId,
      @QueryParam("category") this.category})
      : super(key: key);
  final PageController _pageController = PageController();
  final String? startId;
  final String? category;
  // TODO Add query control first kwesh draw

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KweshListViewModel(
        pageController: _pageController,
        startid: startId,
        categoryId: category,
      ),
      builder: (context, _) {
        final listViewModel = Provider.of<KweshListViewModel>(context);
        print("category : $category");
        return Scaffold(
          appBar: listViewModel.category != null
              ? AppBar(
                  // Remove padding
                  toolbarHeight: 35,
                  title: CategoryDisplayWidget(
                    category: listViewModel.category!,
                    withRedirect: false,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    radius: 16,
                    space: 10,
                  ),
                  centerTitle: false,
                )
              : null,
          body: SafeArea(
            child: PageView.builder(
              itemCount: listViewModel.kweshList.length + 1,
              scrollDirection: Axis.vertical,
              controller: _pageController,
              pageSnapping: true,
              itemBuilder: (context, index) {
                if (index == listViewModel.kweshList.length) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Il n'y a plus de kwesh disponible :(",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            enableDrag: true,
                            useSafeArea: true,
                            useRootNavigator: true,
                            builder: (context) => const CreatePage(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade700,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Crée une nouvelle kwesh!"),
                      )
                    ],
                  );
                }
                final kwesh = listViewModel.kweshList[index];
                return ChangeNotifierProvider<KweshViewModel>(
                  create: (context) => KweshViewModel.init(
                    kwesh,
                    index,
                    listViewModel,
                  ),
                  builder: (context, child) {
                    final vm = Provider.of<KweshViewModel>(context);
                    return KweshWidget(
                      kweshViewModel: vm,
                      displayCategory: category == null ? true : false,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
