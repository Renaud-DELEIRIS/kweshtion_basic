import 'package:injectable/injectable.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/config/injections/injection.dart';
import 'package:kweshtion_basic/enum/tag.enum.dart';

@singleton
class KweshService {
  KweshService();

  @factoryMethod
  static Future<KweshService> inject() async => KweshService();

  static KweshService injected() => injector<KweshService>();

  Future<KweshModel> getKwesh(String id) async {
    return KweshModel(
      answer: null,
      id: '1',
      question:
          'Which Billionaire would you rather be the president of your nation?',
      answers: [
        AnswerModel(
          id: '1',
          answer: 'Elon Musk and his fucking crypto named dogecoin',
          nbVotes: 561,
        ),
        AnswerModel(
          id: '2',
          answer: 'Jeff Bezos',
          nbVotes: 122,
        ),
        AnswerModel(
          id: '3',
          answer: 'Larry Ellison',
          nbVotes: 57,
        ),
        AnswerModel(
          id: '4',
          answer: 'Bill Gates',
          nbVotes: 2800,
        ),
        AnswerModel(
          id: '5',
          answer: 'Mark Zuckerberg',
          nbVotes: 176,
        ),
        AnswerModel(
          id: '6',
          answer: 'Larry Page',
          nbVotes: 232,
        ),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: CategoryModel(
        like: 20,
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
      tag: Tag.decideForMe,
    );
  }

  Future<KweshModel> answerKwesh(String id, String answerId) async {
    return getKwesh(answerId);
  }

  Future<KweshModel> skipKwesh(String id) async {
    return getKwesh(id);
  }
}
