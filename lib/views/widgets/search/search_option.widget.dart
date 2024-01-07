import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/config/app_router.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';
import 'package:kweshtion_basic/viewmodels/kwesh_list.viewmodel.dart';
import 'package:kweshtion_basic/viewmodels/search.viewmodel.dart';

class SearchOptionWidget extends StatelessWidget {
  const SearchOptionWidget({Key? key, required this.searchViewModel})
      : super(key: key);
  final SearchViewModel searchViewModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 325,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).push(CreateCategoryRoute());
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(0),
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Créer une catégorie',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
