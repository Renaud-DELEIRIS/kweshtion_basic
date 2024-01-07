import 'package:flutter/material.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/enum/tag.enum.dart';
import 'package:kweshtion_basic/services/category.service.dart';

class KweshListViewModel extends ChangeNotifier {
  final String? categoryId;
  CategoryModel? category;
  final String? startid;
  Tag? tag;
  final PageController pageController;
  final CategoryService _categoryService = CategoryService.injected();
  final bool _isLoading = false;
  final List<KweshModel> _kweshList = [
    KweshModel(
      answer: null,
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
        like: 34,
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
    KweshModel(
      answer: null,
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
        like: 34,
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
  ];

  KweshListViewModel({
    this.categoryId,
    required this.pageController,
    this.startid,
    this.tag,
  }) {
    // TODO Loast list and start with startid if exist
    // // Filter it by category and tag
    if (categoryId != null) {
      _categoryService.getCategory(categoryId!).then((value) {
        category = value;
        notifyListeners();
      });
    }
    print("vm:");
    print(startid);
  }

  void scrollOne(int pageIndex) {
    print(startid);
    pageController.animateToPage(
      pageIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollTo(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<String> changeTag() async {
    // Select

    // TODO Launch search
    notifyListeners();

    return '';
  }

  List<KweshModel> get kweshList => _kweshList;
  bool get isLoading => _isLoading;
}
