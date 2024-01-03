import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';

class CategoryDisplayWidget extends StatelessWidget {
  final CategoryModel category;
  final withRedirect;

  const CategoryDisplayWidget(
      {Key? key, required this.category, this.withRedirect = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: withRedirect
              ? () => AutoRouter.of(context)
                  .navigateNamed('/category/${category.id}')
              : null,

          // Width fit

          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(0, 0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: category.avatar != null
                    ? NetworkImage(category.avatar!)
                    : null,
                radius: 12,
                backgroundColor: Colors.primaries[category.name.length % 10],
                child: Text(
                  category.name[0].toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                category.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ],
    );
  }
}
