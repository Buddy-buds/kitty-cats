import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/src/models/file_model.dart';

import 'package:test_app/src/utils/logger.dart';
import 'package:test_app/src/models/cat_model.dart';

const String RANDOM_CAT_URL = "https://aws.random.cat/meow";

class CatApiProvider {
  final logger = getLogger("CatApiProvider");

  Future<CatModel> fetchRandomCat() async {
    logger.log("Fetching random cat");
    Response response = await get(RANDOM_CAT_URL);

    if (response.statusCode == 200) {
      return CatModel(
        image: FileModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    }

    throw Exception(
        "Request returned a ${response.statusCode} status code - $RANDOM_CAT_URL");
  }
}
