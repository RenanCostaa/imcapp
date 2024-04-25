import 'dart:math';

class IMC {
  double peso;
  double altura;

  IMC({required this.peso, required this.altura});

  double get calcImc{
    return peso/pow(altura,2);
  }
}