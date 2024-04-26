
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imcapp/imc.dart';
import 'package:imcapp/resultado.dart';

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
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'images/weight.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _alturaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')), // Permite apenas números
                      ],
                      decoration: const InputDecoration(labelText: 'Altura'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                          decoration:
                              const InputDecoration(labelText: 'Peso'))),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red), 
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20.0))
                            ),
                          onPressed: _calculaIMC,
                          child: const Text('Calcular IMC', style: TextStyle(fontSize: 16))))
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

    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Resultado(imc: imc)));
    });
  }
}
