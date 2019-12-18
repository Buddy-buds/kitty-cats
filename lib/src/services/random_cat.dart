import 'package:http/http.dart';

import 'package:test_app/src/utils/logger.dart';

const String RANDOM_CAT_URL = "https://aws.random.cat/meow";

Future<String> fetchCatImage() async {
  final log = getLogger("RandomCatService");

  log.log("Fetching cat at $RANDOM_CAT_URL");
  Response response = await get(RANDOM_CAT_URL);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return response.body;
  }

  throw ClientException("Request returned a ${response.statusCode} status code",
      Uri.parse(RANDOM_CAT_URL));
}
