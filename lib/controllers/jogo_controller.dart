import 'package:flutter/cupertino.dart';

class JogoController {
  final String nomeJogador1;
  final Color corJogador1;
  final String? nomeJogador2;
  final Color? corJogador2;

  JogoController({
    required this.nomeJogador1,
    required this.corJogador1,
    this.nomeJogador2,
    this.corJogador2,
  });
}
