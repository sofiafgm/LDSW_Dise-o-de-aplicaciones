import 'package:aplicaciones_moviles/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:aplicaciones_moviles/services/movie_service.dart';
import 'package:aplicaciones_moviles/models/movie.dart';
import 'package:aplicaciones_moviles/pages/movies_page.dart';

class NewMoviePage extends StatefulWidget {
  final Movie? movie;

  const NewMoviePage({Key? key, this.movie}) : super(key: key);

  @override
  State<NewMoviePage> createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _coverController;
  late TextEditingController _directorController;
  late TextEditingController _yearController;
  late TextEditingController _synopsisController;
  late TextEditingController _genreController;

  final MovieService _movieService = MovieService();

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.movie?.title ?? '');
    _coverController = TextEditingController(text: widget.movie?.cover ?? '');
    _directorController =
        TextEditingController(text: widget.movie?.director ?? '');
    _yearController =
        TextEditingController(text: widget.movie?.year?.toString() ?? '');
    _synopsisController =
        TextEditingController(text: widget.movie?.synopsis ?? '');
    _genreController = TextEditingController(text: widget.movie?.genre ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _coverController.dispose();
    _directorController.dispose();
    _yearController.dispose();
    _synopsisController.dispose();
    _genreController.dispose();
    super.dispose();
  }

  Future<void> _saveMovie() async {
    if (_formKey.currentState!.validate()) {
      final movie = Movie(
        id: widget.movie?.id ?? '',
        title: _titleController.text,
        cover: _coverController.text,
        director: _directorController.text,
        year: int.parse(_yearController.text),
        synopsis: _synopsisController.text,
        genre: _genreController.text,
      );

      try {
        if (widget.movie == null) {
          await _movieService.addMovie(movie);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Película registrada!')),
          );
        } else {
          await _movieService.updateMovie(movie);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Película actualizada!')),
          );
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviesPage(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar la película: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.movie == null ? 'Registrar Película' : 'Actualizar Película',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe el título de la película';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _coverController,
                  decoration: const InputDecoration(
                    labelText: 'Imagen de portada (URL)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe la URL de la imagen de portada';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _directorController,
                  decoration: const InputDecoration(
                    labelText: 'Director',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe el nombre del director';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _yearController,
                  decoration: const InputDecoration(
                    labelText: 'Año',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe el año de lanzamiento';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Escribe un año válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _synopsisController,
                  decoration: const InputDecoration(
                    labelText: 'Sinopsis',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe una sinopsis';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _genreController,
                  decoration: const InputDecoration(
                    labelText: 'Género',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Escribe el género';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveMovie,
                    child: Text(widget.movie == null
                        ? 'Registrar Película'
                        : 'Actualizar Película'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
