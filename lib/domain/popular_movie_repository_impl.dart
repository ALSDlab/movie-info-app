import 'package:movie_info_app/data/model/popular_movie_model.dart';
import 'package:movie_info_app/data/repository/popular_movie_repository.dart';

import '../data/source/popular_movie_source.dart';
import '../data/mapper/popular_movie_mapper.dart';

class PopularMovieRepositoryImpl implements PopularMovieRepository {
  final _api = MovieApi();

  @override
  Future<PopularMovieModel> getPopularMovieResults(int page) async {
    final dto = await _api.getPopularMovies(page);

    return dto.toModel();
  }
}
