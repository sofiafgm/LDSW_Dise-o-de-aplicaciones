import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie Finder',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 126, 60, 164)),
        ),
        home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
@override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 247, 248, 249),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Bienvenido a Movie Finder",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24, 
              fontWeight: FontWeight.bold,  
              decoration: TextDecoration.none),
          ),
          const SizedBox(height: 60),
          
          ImageSection(
    image: 'images/tape.png'),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image, width: 450, height: 180, fit: BoxFit.cover);
  }
}