import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/search.model.dart';
import 'package:kweshtion_basic/config/app_router.dart';

class SearchButtonWidget extends StatelessWidget {
  final SearchModel search;
  const SearchButtonWidget({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: (TextButton(
        onPressed: () => AutoRouter.of(context).push(HomeRoute(
          category: search.targetId,
        )),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: search.displayAvatar == null
                      ? null
                      : NetworkImage(search.displayAvatar!),
                  child: Text(
                    search.displayName[0].toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      search.displayName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    if (search.like != null) const SizedBox(height: 5),
                    if (search.like != null)
                      Row(
                        children: [
                          Text(
                            search.like.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 16,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
            )
          ],
        ),
      )),
    );
  }
}
