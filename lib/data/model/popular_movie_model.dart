import '../dto/popular_movie_dto.dart';

class PopularMovieModel {
  int nowPage;
  List<Results> results;
  int totalPages;
  int totalResults;

//<editor-fold desc="Data Methods">
  PopularMovieModel({
    required this.nowPage,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PopularMovieModel &&
          runtimeType == other.runtimeType &&
          nowPage == other.nowPage &&
          results == other.results &&
          totalPages == other.totalPages &&
          totalResults == other.totalResults);

  @override
  int get hashCode =>
      nowPage.hashCode ^
      results.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;

  @override
  String toString() {
    return 'PopularMovieModel{ nowPage: $nowPage, results: $results, totalPages: $totalPages, totalResults: $totalResults,}';
  }

  PopularMovieModel copyWith({
    int? nowPage,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PopularMovieModel(
      nowPage: nowPage ?? this.nowPage,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nowPage': nowPage,
      'results': results,
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory PopularMovieModel.fromJson(Map<String, dynamic> map) {
    return PopularMovieModel(
      nowPage: map['nowPage'] as int,
      results: map['results'] as List<Results>,
      totalPages: map['totalPages'] as int,
      totalResults: map['totalResults'] as int,
    );
  }

//</editor-fold>
}