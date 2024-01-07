import 'package:injectable/injectable.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/config/injections/injection.dart';

@singleton
class CategoryService {
  CategoryService();

  @factoryMethod
  static Future<CategoryService> inject() async => CategoryService();

  static CategoryService injected() => injector<CategoryService>();

  Future<CategoryModel> getCategory(String id) async {
    return CategoryModel(
      id: id,
      author: UserModel(
        createdAt: DateTime.now(),
        email: 'renauddeliris@gmail.com',
        id: '1',
        updatedAt: DateTime.now(),
        username: 'renauddeliris',
      ),
      createdAt: DateTime.now(),
      like: 4,
      name: 'Life',
      updatedAt: DateTime.now(),
      avatar: null,
    );
  }
}
