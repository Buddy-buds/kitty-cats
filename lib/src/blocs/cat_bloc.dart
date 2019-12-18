import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import 'package:test_app/src/models/cat_model.dart';
import 'package:test_app/src/resources/repository.dart';

class CatBloc {
  final _repository = Repository();
  final _catFetcher = PublishSubject<CatModel>();

  Observable<CatModel> get randomCat => _catFetcher.stream;

  fetchRandomCat() async {
    CatModel catModel = await _repository.fetchRandomCat();
    _catFetcher.sink.add(catModel);
  }

  dispose() => _catFetcher.close();
}

final CatBloc bloc = CatBloc();
