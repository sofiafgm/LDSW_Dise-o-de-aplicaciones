class Movie {
  final String id;
  final String title;
  final String cover;
  final String director;
  final int year;
  final String synopsis;
  final String genre;

  Movie({
    this.id = '',
    required this.title,
    required this.cover,
    required this.director,
    required this.year,
    required this.synopsis,
    required this.genre,
  });

  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      id: data['id'] ?? '',
      title: data['title'] ?? 'Sin título',
      cover: data['cover'] ?? '',
      director: data['director'] ?? 'Desconocido',
      year: data['year'] ?? 0,
      synopsis: data['synopsis'] ?? '',
      genre: data['genre'] ?? 'Desconocido',
    );
  }
}
