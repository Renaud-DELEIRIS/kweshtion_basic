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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => AutoRouter.of(context).pushNamed('/history'),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
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
