import 'package:flutter/material.dart';

class PlayerModel {
  final String namePlayer1;
  final Color colorPlayer1;
  final String tagPlayer1;
  final String? namePlayer2;
  final Color colorPlayer2;
  final String tagPlayer2;
  final bool gameFinished;
  final String? a1;
  final String? a2;
  final String? a3;
  final String? b1;
  final String? b2;
  final String? b3;
  final String? c1;
  final String? c2;
  final String? c3;

  PlayerModel({
    this.tagPlayer1 = 'X',
    this.tagPlayer2 = 'O',
    this.gameFinished = false,
    this.a1,
    this.a2,
    this.a3,
    this.b1,
    this.b2,
    this.b3,
    this.c1,
    this.c2,
    this.c3,
    required this.namePlayer1,
    this.colorPlayer1 = Colors.white,
    this.namePlayer2,
    this.colorPlayer2 = Colors.black,
  });
}
