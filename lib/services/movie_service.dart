import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String cover;

  Movie({required this.title, required this.cover});

  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      title: data['title'] ?? 'Sin título',
      cover: data['cover'] ?? '',
    );
  }
}

class MovieService {
  final CollectionReference _movies = FirebaseFirestore.instance.collection('movies');

  Future<List<Movie>> fetchMovies() async {
    final snapshot = await _movies.get();
    return snapshot.docs.map((doc) => Movie.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }
}
