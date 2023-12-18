import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';

class KweshDetailsWidget extends StatelessWidget {
  const KweshDetailsWidget({Key? key, required this.kweshViewModel})
      : super(key: key);
  final KweshViewModel kweshViewModel;

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
                    Navigator.of(context).pop();
                    kweshViewModel.hideAuthorKwesh();
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
                          Icons.block,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Bloquer ${kweshViewModel.kwesh.author.username}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.grey.shade700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    kweshViewModel.reportKwesh();
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
                          Icons.flag,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Report',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
