import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';

import '../dto/popular_movie_dto.dart';

class MovieApi {
  Future<MovieDto> getPopularMovies(int page) async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys('2db06e868a8bc87ab1bb2a18a35327fa',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZGIwNmU4NjhhOGJjODdhYjFiYjJhMThhMzUzMjdmYSIsInN1YiI6IjY1YTEyMDBiMTk2OTBjMDEyYjhhYzUwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f7MQy7WMFE6DsVWrMwRq93IlD0O6EmEeEbhUu2w0epA'),
      logConfig: const ConfigLogger(
        //must be true than only all other logs will be shown
        showLogs: true,
        showErrorLogs: true,
      ),
        defaultLanguage:'ko-KR',
    );
    final response = await tmdbWithCustomLogs.v3.movies.getPopular(page: page);
    print(response);
    return MovieDto.fromJson(response);
  }
}
