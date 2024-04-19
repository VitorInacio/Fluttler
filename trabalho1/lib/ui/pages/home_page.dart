import 'dart:js_interop';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho1/bloc/calcular_imc_bloc.dart';
import 'package:trabalho1/ui/pages/sobre_page.dart';
import 'package:trabalho1/ui/widgets/campo_texto.dart';
import 'package:trabalho1/ui/widgets/menu_lateral.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map> listaMenu;

  void _abrirSobre() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SobrePage()));
  }

  @override
  Widget build(BuildContext context) {
    final _calcImc = CalcularImcBloc(context);

    listaMenu = [
      {"Texto": "Sobre", "Clique": _abrirSobre}
    ];
    
    return Placeholder(
        child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate_outlined, size: 36,),
                SizedBox(width: 8),
                Text('Calclar IMC', style: TextStyle(color: Colors.black),)
              ],
            ),
            backgroundColor: Colors.greenAccent.shade400,
          ),
          drawer: MenuLateral(listaItens: listaMenu),
          
          body: Column(
            children: [
              CampoTexto(_calcImc.pesoC, 'Peso', 'KG'),
              CampoTexto(_calcImc.alturaC, 'Altura', 'm'),
              ElevatedButton(onPressed: () {
                setState(() {
                  _calcImc.calcular();
                });
              } , child: const Text('Calcular')),
              
              Text(_calcImc.res, style: TextStyle(fontSize: 32),)
            ],
          ),
        ),
    );
  }
}
