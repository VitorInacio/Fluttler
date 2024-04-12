import 'package:aula06_api/datasources/remote/pokemon_remote.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pokedex', style: TextStyle(color: Colors.amber.shade500)),
          backgroundColor: Colors.amber.shade500,
        ),
      ),
    );

  }

}

