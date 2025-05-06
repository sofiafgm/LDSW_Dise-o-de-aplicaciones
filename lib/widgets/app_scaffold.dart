import 'package:flutter/material.dart';
import 'package:aplicaciones_moviles/pages/new_movie_page.dart';
import 'package:aplicaciones_moviles/pages/movies_page.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const AppScaffold({Key? key, required this.body, this.title = 'Mi App'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('images/film-tape.png'),
              size: 60,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoviesPage(),
                ),
              );
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 224, 224),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              overlayColor: const Color.fromARGB(255, 17, 16, 16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewMoviePage(),
                ),
              );
            },
            child: const Text(
              "Agregar Película",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
