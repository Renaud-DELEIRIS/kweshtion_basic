import 'package:injectable/injectable.dart';
import 'package:kweshtion_basic/api/models/response/search.model.dart';
import 'package:kweshtion_basic/config/injections/injection.dart';

@singleton
class SearchService {
  SearchService();

  @factoryMethod
  static Future<SearchService> inject() async => SearchService();

  static SearchService injected() => injector<SearchService>();

  Future<List<SearchModel>> search(String input) async {
    return [
      SearchModel(
        type: SearchType.category,
        displayName: "Categorie 1",
        targetId: "1",
        isHot: true,
        like: 10,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 1",
        targetId: "1",
        isHot: true,
      ),
      SearchModel(
        type: SearchType.category,
        displayName: "Categorie 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
    ];
  }

  Future<List<SearchModel>> loadDefaultRecomendation() async {
    return [
      SearchModel(
        type: SearchType.category,
        displayName: "Categorie 1",
        targetId: "1",
        isHot: true,
        like: 10,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 1",
        targetId: "1",
        isHot: true,
      ),
      SearchModel(
        type: SearchType.category,
        displayName: "Categorie 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
      SearchModel(
        type: SearchType.user,
        displayName: "User 2",
        targetId: "1",
        isHot: false,
      ),
    ];
  }
}
