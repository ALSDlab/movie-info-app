import '../model/popular_movie_model.dart';

abstract interface class PopularMovieRepository {
  Future<PopularMovieModel> getPopularMovieResults(int page);
}