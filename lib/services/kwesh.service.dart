import 'package:injectable/injectable.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/config/injections/injection.dart';

@singleton
class KweshService {
  KweshService();

  @factoryMethod
  static Future<KweshService> inject() async => KweshService();

  static KweshService injected() => injector<KweshService>();

  Future<KweshModel> getKwesh(String id) async {
    return KweshModel(
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
    );
  }

  Future<KweshModel> answerKwesh(String id, String answerId) async {
    return getKwesh(answerId);
  }
}
