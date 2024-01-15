import 'package:flutter/cupertino.dart';

import '../data/dto/popular_movie_dto.dart';
import '../data/model/popular_movie_model.dart';
import '../domain/popular_movie_repository_impl.dart';

class PopularMovieViewModel extends ChangeNotifier {
  final _repository = PopularMovieRepositoryImpl();
  List<Results> results = [];

  Future<void> searchMovies(int page) async {
    PopularMovieModel models = await _repository.getPopularMovieResults(page);
    results = models.results;
    notifyListeners();
  }
}
