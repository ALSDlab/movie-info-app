import '../dto/popular_movie_dto.dart';
import '../model/popular_movie_model.dart';

extension DtoToModel on MovieDto {
  PopularMovieModel toModel() {
    return PopularMovieModel(
      nowPage: page ?? 0,
      results: results ?? [],
      totalPages: totalPages ?? 0,
      totalResults: totalPages ?? 0,
    );
  }
}
