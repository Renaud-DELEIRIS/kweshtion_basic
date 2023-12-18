import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';

class CategoryDisplayWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryDisplayWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AutoRouter.of(context).navigateNamed('/category/${category.id}'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                category.avatar != null ? NetworkImage(category.avatar!) : null,
            radius: 15,
            backgroundColor: Colors.primaries[category.name.length % 10],
            child: Text(
              category.name[0].toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(width: 5),
          Text(category.name),
        ],
      ),
    );
  }
}
