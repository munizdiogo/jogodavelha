// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum enumPlayer { PLAYER1, PLAYER2, TIED }

class PlayerModel {
  bool autoChangePlayer;
  enumPlayer activePlayer;
  enumPlayer? winnerPlayer;
  String namePlayer1;
  final Color colorPlayer1;
  final String tagPlayer1;
  final String? namePlayer2;
  final Color colorPlayer2;
  final String tagPlayer2;
  bool gameFinished;
  String? a1;
  String? a2;
  String? a3;
  String? b1;
  String? b2;
  String? b3;
  String? c1;
  String? c2;
  String? c3;

  PlayerModel({
    this.autoChangePlayer = true,
    required this.activePlayer,
    this.winnerPlayer,
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
