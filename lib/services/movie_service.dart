import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import '../models/movie.dart';

class MovieService {
  final CollectionReference _movies =
      FirebaseFirestore.instance.collection('movies');

  Future<List<Movie>> fetchMovies() async {
  final snapshot = await _movies.get();
  return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Movie(
      id: doc.id,
      title: data['title'] ?? '',
      cover: data['cover'] ?? '',
      director: data['director'] ?? '',
      year: data['year'] ?? 0,
      synopsis: data['synopsis'] ?? '',
      genre: data['genre'] ?? '',
    );
  }).toList();
}

   Future<void> addMovie(Movie movie) async {
    try {
      await _movies.add({
        'title': movie.title,
        'cover': movie.cover,
        'director': movie.director,
        'year': movie.year,
        'synopsis': movie.synopsis,
        'genre': movie.genre,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error al agregar la película: $e');
    }
  }

  Future<void> updateMovie(Movie movie) async {
  try {
    await _movies.doc(movie.id).update({
      'title': movie.title,
      'cover': movie.cover,
      'director': movie.director,
      'year': movie.year,
      'synopsis': movie.synopsis,
      'genre': movie.genre,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    throw Exception('Error al actualizar la película: $e');
  }
}

  Future<Response> deleteMovie(String id) async {
    return await _movies.doc(id).delete().then((_) {
      return Response('Pelicula eliminada', 200);
    }).catchError((error) {
      return Response('Error deleting movie: $error', 500);
    });
  }
}
