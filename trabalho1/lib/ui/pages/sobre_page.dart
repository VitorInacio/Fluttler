import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({super.key});

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sobre o App'),
          backgroundColor: Colors.greenAccent.shade400,
        ),
        body: const Column(
          children: [
            Icon(Ionicons.person, size: 100,),
            Text('Vitor Inácio'),
            Text('12756')
          ],
        ),
      ),
    );
  }
}
