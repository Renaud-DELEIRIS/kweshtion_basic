import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';

class CategoryDisplayWidget extends StatelessWidget {
  final CategoryModel category;
  final bool withRedirect;
  final TextStyle? textStyle;
  final double? radius;
  final double? space;

  const CategoryDisplayWidget({
    Key? key,
    required this.category,
    this.withRedirect = true,
    this.textStyle,
    this.radius = 12,
    this.space = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: withRedirect
              ? () {
                  final router = AutoRouter.of(context);
                  router.pop();
                  router.navigateNamed('/home');
                  router.pushNamed('/home?category=${category.name}');
                }
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
              Hero(
                tag: '5',
                transitionOnUserGestures: true,
                child: CircleAvatar(
                  backgroundImage: category.avatar != null
                      ? NetworkImage(category.avatar!)
                      : null,
                  radius: radius,
                  backgroundColor: Colors.primaries[category.name.length % 10],
                  child: Text(
                    category.name[0].toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: radius,
                    ),
                  ),
                ),
              ),
              SizedBox(width: space),
              Text(
                category.name,
                style: textStyle ??
                    TextStyle(
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
