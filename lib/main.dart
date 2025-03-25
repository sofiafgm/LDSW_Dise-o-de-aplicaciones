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
            "Flutter Widgets",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
          ),
          const SizedBox(height: 20), 

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Row 1", style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 18, decoration: TextDecoration.none)),
              Text("Row 2", style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 18, decoration: TextDecoration.none)),
            ],
          ),
          const SizedBox(height: 20),
      
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Stack",
                    style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}