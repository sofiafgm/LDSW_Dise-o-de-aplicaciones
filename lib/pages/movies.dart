import 'package:flutter/material.dart';
import '../services/movie_service.dart';

class MoviesPage extends StatelessWidget {
  final MovieService service = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Películas")),
      body: FutureBuilder(
        future: service.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final movies = snapshot.data as List<Movie>;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Card(
                child: ListTile(
                  leading: Image.network(movie.cover, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(movie.title),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
