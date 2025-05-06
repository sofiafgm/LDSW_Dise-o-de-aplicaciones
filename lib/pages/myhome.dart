import 'package:aplicaciones_moviles/pages/login_page.dart';
import 'package:aplicaciones_moviles/pages/register_page.dart';
import 'package:flutter/material.dart';


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

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text('Login',
              style: TextStyle(
                color: Color.fromARGB(255, 5, 5, 5),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: const Text('Registrarse',
              style: TextStyle(
                color: Color.fromARGB(255, 5, 5, 5),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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