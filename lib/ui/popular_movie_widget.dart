import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/dto/popular_movie_dto.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({super.key, required this.movieItem});

  final Results movieItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // 배경그림
        Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/${movieItem.backdropPath}'),
                    fit: BoxFit.cover)),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(color: Colors.black.withOpacity(0.1)),
              ),
            )),
        // 포스터 및 영화정보
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 포스터
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${movieItem.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 영화정보
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // 제목
                          Text(
                            '${movieItem.title}',
                            style: const TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //날짜
                                Text(
                                  '${movieItem.releaseDate}',
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                Text('\u{1F31F} ${movieItem.voteAverage} / 10',
                                  style: const TextStyle(fontSize: 13, color: Colors.white),),
                              ],
                            ),
                          ),
                          // 상세내용
                          Text('${movieItem.overview}',
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                            overflow: TextOverflow.ellipsis, // 텍스트가 컨테이너를 넘어갈 때 생략 (...) 표시
                            maxLines: 5,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
