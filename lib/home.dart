import 'dart:html';

import 'package:flutter/material.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        actions: [
          IconButton(
              icon: const Icon(Icons.replay_outlined), onPressed: _limpaCampos)
        ],
      ),
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }

  void _limpaCampos() {}
}
