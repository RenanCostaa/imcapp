
import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';

class HomeIMC extends StatefulWidget {
  const HomeIMC({super.key});

  @override
  HomeIMCState createState() => HomeIMCState();
}

class HomeIMCState extends State<HomeIMC> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IMC - Tabajara Calculator'),
          actions: [
            IconButton(
                icon: const Icon(Icons.replay_outlined),
                onPressed: _limpaCampos)
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'images/weight.jpg',
                        height: 200,
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _alturaController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Altura'),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'Peso'))),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20)),
                          onPressed: _calculaIMC,
                          child: const Text('Calcular IMC')))
                ]))));
  }

  void _limpaCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  _calculaIMC() {
    double altura = double.parse(_alturaController.text);
    double peso = double.parse(_pesoController.text);

    var imc = IMC(altura: altura, peso: peso);

    _pesoController.text = imc.calcImc.toString();
  }
}
