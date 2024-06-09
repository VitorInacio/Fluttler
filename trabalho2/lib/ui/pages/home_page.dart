import 'package:flutter/material.dart';
import 'package:trabalho2/models/character.dart';
import 'package:trabalho2/ds/remote/genshin_remote.dart';
import 'package:trabalho2/ui/pages/detalhes_page.dart';
import 'package:trabalho2/ui/widgets/criar_lista.dart';

import '../widgets/circulo_espera.dart';

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
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Genshin Impact', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlue,
        ),
        body: FutureBuilder<List<Character>>(
          future: GenshinRemote().get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CirculoEspera();
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum dado foi encontrado'));
            } else {
              return _criarLista(context, snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(BuildContext context, List<Character> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return CriarLista(lista[index]);
      }
    );
  }
}
