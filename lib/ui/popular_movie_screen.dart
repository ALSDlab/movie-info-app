import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/popular_movie_view_model.dart';
import 'package:movie_info_app/ui/popular_movie_widget.dart';
import 'package:provider/provider.dart';

class PopularMovieScreen extends StatelessWidget {
  const PopularMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PopularMovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          '인기영화',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                child: const Text('영화정보 보기'),
                onPressed: () {
                  viewModel.searchMovies(1);
                },
              ),
              const SizedBox(
                width: double.infinity,
                height: 30,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.results.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    final movieItem = viewModel.results[index];
                    return PopularMovieWidget(movieItem: movieItem);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
