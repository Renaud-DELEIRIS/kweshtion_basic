import 'package:flutter/material.dart';
import 'package:kweshtion_basic/constants/tag.constant.dart';
import 'package:kweshtion_basic/enum/tag.enum.dart';

class TagWidget extends StatelessWidget {
  final Tag tag;
  late TagDisplayData tagDisplayData;
  TagWidget({Key? key, required this.tag}) : super(key: key) {
    tagDisplayData = TagDisplayData(tag);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(tagDisplayData.color),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tagDisplayData.icon + ' ' + tagDisplayData.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
