// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum enumPlayer { PLAYER1, PLAYER2, TIED }

class PlayerModel {
  bool autoChangePlayer;
  enumPlayer activePlayer;
  enumPlayer? winnerPlayer;
  String namePlayer1;
  final String colorPlayer1;
  final String tagPlayer1;
  final String? namePlayer2;
  final String colorPlayer2;
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
  String? idFirebase;
  String? dateTime = DateTime.now().toString();

  PlayerModel({
    this.autoChangePlayer = true,
    this.activePlayer = enumPlayer.PLAYER1,
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
    this.namePlayer1 = 'Jogador 1',
    this.colorPlayer1 = '',
    this.namePlayer2,
    this.colorPlayer2 = '',
    this.dateTime,
  });
}
