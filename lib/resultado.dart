import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';

class Resultado extends StatefulWidget{
  final IMC imc;
  const Resultado({super.key, required this.imc});

  @override
  _ResultadoState createState() => _ResultadoState(imc: imc);
}


class _ResultadoState extends State<Resultado> {

  final IMC _imc;
  late Color _corBorda;

  _ResultadoState({ required IMC imc}) : _imc = imc {
    switch (imc.faixa) {
      case FaixaIMC.AbaixoIdeal:
        _corBorda = Colors.green;
        break;
      case FaixaIMC.PesoIdeal:
        _corBorda = Colors.blue;
        break;
      case FaixaIMC.AcimaIdeal:
        _corBorda = Colors.orange;
        break;
      case FaixaIMC.ObesidadeI:
        _corBorda = Colors.orangeAccent;
        break;
      case FaixaIMC.ObesidadeII:
        _corBorda = Colors.red;
        break;
      case FaixaIMC.ObesidadeIII:
        _corBorda = Colors.deepPurple;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: _corBorda, width: 9),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(_imc.calcImc.toStringAsPrecision(3),
                  style: TextStyle(fontSize: 90, color: _corBorda),)),
                  Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Classificação:',
                          style: TextStyle(fontSize: 16, color: _corBorda),
                        )),
                  Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          '${_imc.faixa.descricao}',
                          style: TextStyle(fontSize: 20, color: _corBorda),
                        )),
                  const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                            'O seu IMC indica se você possui o peso ideal, se '
                            'está acima ou abaixo do peso. Lembre-se que uma boa alimentação '
                            'e exercícios físicos regulares são fundamentais para '
                            'manter uma boa saúde. '))
              ],
            ),
          ),
        ),
      )
    );
  }
}