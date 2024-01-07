import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/config/app_router.dart';
import 'package:kweshtion_basic/views/page/create.page.dart';

@RoutePage()
class BottomBarPage extends StatelessWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AutoTabsRouter(
        routes: [
          HomeRoute(),
          const SearchRootRoute(),
          HistoryRoute(),
          const ProfileRoute(),
        ],
        homeIndex: 0,
        builder: (context, child) {
          final tabsRouter = context.tabsRouter;
          final selectedIndex = tabsRouter.activeIndex;
          return Scaffold(
            body: child,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  enableDrag: true,
                  useSafeArea: true,
                  builder: (context) => const CreatePage(),
                );
              },
              backgroundColor: Colors.amber.shade700,
              child: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: 60,
              color: Colors.black,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      tabsRouter.setActiveIndex(0);
                    },
                    icon: Icon(
                      Icons.home,
                      // If selected index is 0 then color is blue
                      color: selectedIndex == 0
                          ? Colors.amber.shade700
                          : Colors.white,
                    ),
                  ),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      tabsRouter.setActiveIndex(1);
                    },
                    icon: Icon(
                      Icons.search,
                      color: selectedIndex == 1
                          ? Colors.amber.shade700
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      tabsRouter.setActiveIndex(2);
                    },
                    icon: Icon(
                      Icons.history,
                      color: selectedIndex == 2
                          ? Colors.amber.shade700
                          : Colors.white,
                    ),
                  ),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {
                      tabsRouter.setActiveIndex(3);
                    },
                    icon: Icon(
                      Icons.person,
                      color: selectedIndex == 3
                          ? Colors.amber.shade700
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
