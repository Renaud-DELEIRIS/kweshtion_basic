import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History Page')),
    );
  }
}
