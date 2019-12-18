import 'package:test_app/src/models/cat_model.dart';
import 'package:test_app/src/resources/cat_api_provider.dart';

class Repository {
  final catApiProvider = CatApiProvider();

  Future<CatModel> fetchRandomCat() => catApiProvider.fetchRandomCat();
}