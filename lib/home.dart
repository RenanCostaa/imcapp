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
        children: [
          Image.asset('images/weight.jpg'),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Altura',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Peso',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {},
            child: const Text('Calcular IMC'),
          )
        ],
      )),
    );
  }

  void _limpaCampos() {}

  _calculaIMC() {}
}
