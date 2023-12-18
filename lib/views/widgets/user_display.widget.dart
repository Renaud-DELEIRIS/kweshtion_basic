import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';

class UserDisplayWidget extends StatelessWidget {
  final UserModel user;

  const UserDisplayWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              user.avatar != null ? NetworkImage(user.avatar!) : null,
          radius: 15,
          backgroundColor: Colors.primaries[user.username.length % 10],
          child: Text(
            user.username[0].toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(width: 5),
        Text(user.username),
      ],
    );
  }
}
