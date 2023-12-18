import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/viewmodels/kwesh.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/kwesh.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Pour vous'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => AutoRouter.of(context).pushNamed('/history'),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => AutoRouter.of(context).pushNamed('/history'),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider<KweshViewModel>(
            create: (context) => KweshViewModel.init(
              KweshModel(
                id: '1',
                question: 'What is the meaning of life?',
                answers: [
                  AnswerModel(
                    id: '1',
                    answer: 'test',
                    nbVotes: 0,
                  ),
                  AnswerModel(
                    id: '2',
                    answer: 'test 2',
                    nbVotes: 0,
                  ),
                  AnswerModel(
                    id: '3',
                    answer: 'test 3',
                    nbVotes: 0,
                  ),
                ],
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: CategoryModel(
                  id: '1',
                  author: UserModel(
                    createdAt: DateTime.now(),
                    email: 'renauddeliris@gmail.com',
                    id: '1',
                    updatedAt: DateTime.now(),
                    username: 'renauddeliris',
                  ),
                  createdAt: DateTime.now(),
                  name: 'Life',
                  updatedAt: DateTime.now(),
                ),
                author: UserModel(
                  createdAt: DateTime.now(),
                  email: 'renauddeliris@gmail.com',
                  id: '1',
                  updatedAt: DateTime.now(),
                  username: 'renauddeliris',
                ),
              ),
              _pageController,
              index,
            ),
            builder: (context, child) {
              final vm = Provider.of<KweshViewModel>(context);
              return KweshWidget(kweshViewModel: vm);
            },
          );
        },
      ),
    );
  }
}
