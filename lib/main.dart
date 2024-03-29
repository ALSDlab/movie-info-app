import 'package:flutter/material.dart';
import 'package:movie_info_app/ui/popular_movie_screen.dart';
import 'package:movie_info_app/ui/popular_movie_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularMovieViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const PopularMovieScreen(),
      ),
    );
  }
}


