import 'package:flutter/cupertino.dart';
import 'package:jogodavelha/database/database.dart';
import 'package:jogodavelha/models/player_model.dart';

class PlayerController with ChangeNotifier {
  PlayerModel playerModelController = PlayerModel(
    activePlayer: enumPlayer.PLAYER1,
    namePlayer1: '',
  );

  String typeGame = "x1";

  Database database = Database();

  double lineAnimationAlignmentX = 0;
  double lineAnimationAlignmentY = 0;
  double lineAnimationRotation = 0;
  Map<String, double> sizeLineAnimation = {
    'beginWidth': 0,
    'beginHeight': 0,
    'endWidth': 0,
    'endHeight': 0,
  };

  Future<void> createGame(
      {required PlayerModel playerModel, required String typeGame}) async {
    playerModelController = playerModel;
    playerModelController.dateTime = DateTime.now().toString();

    if (typeGame == 'x1') {
      var response =
          await database.createGame(playerModel: playerModelController);
      playerModelController.idGameFirebase = response;
    }
    notifyListeners();
  }

  Future getInfoMoveGame() async {
    var response = await database.getGame(playerModelController.idGameFirebase);
    notifyListeners();
    return response;
  }

  Future<void> sendInfoGame() async {
    await database.updateGame(
        playerModelController.idGameFirebase, playerModelController);
    notifyListeners();
    return Future.value();
  }

  void updateController() {
    notifyListeners();
  }

  bool verificationGameFinish() {
    sizeLineAnimation['endWidth'] = 8;
    sizeLineAnimation['endHeight'] = 350;

    if (getResultLine1()) {
      setWinnerPlayer(playerModelController.a1!);
      setValuesAnimationLine(alignX: 0, alignY: -1.5, rotation: 0.25);
    } else if (getResultLine2()) {
      setWinnerPlayer(playerModelController.b1!);
      setValuesAnimationLine(alignX: 0, alignY: 0, rotation: 0.25);
    } else if (getResultLine3()) {
      setWinnerPlayer(playerModelController.c1!);
      setValuesAnimationLine(alignX: 0, alignY: 1.5, rotation: 0.25);
    } else if (getResultColumn1()) {
      setWinnerPlayer(playerModelController.a1!);
      setValuesAnimationLine(alignX: -0.6, alignY: 0, rotation: 0);
    } else if (getResultColumn2()) {
      setWinnerPlayer(playerModelController.a2!);
      setValuesAnimationLine(alignX: 0, alignY: 0, rotation: 0);
    } else if (getResultColumn3()) {
      setWinnerPlayer(playerModelController.a3!);
      setValuesAnimationLine(alignX: 0.6, alignY: 0, rotation: 0);
    } else if (getResultDiagonalA1C3()) {
      setWinnerPlayer(playerModelController.a1!);
      setValuesAnimationLine(alignX: 0, alignY: 0, rotation: -0.13);
    } else if (getResultDiagonalA3C1()) {
      setWinnerPlayer(playerModelController.a3!);
      setValuesAnimationLine(alignX: 0, alignY: 0, rotation: 0.13);
    } else if (getResultTied()) {
      setWinnerPlayer('TIED');
      setValuesAnimationLine(alignX: 0, alignY: 0, rotation: 0);
      sizeLineAnimation['endWidth'] = 350;
      sizeLineAnimation['endHeight'] = 350;
    }

    if (playerModelController.winnerPlayer != null) {
      playerModelController.gameFinished = true;
      return true;
    }
    return false;
  }

/*
** RESULTADO DO JOGO
*/

  enumPlayer getWinnerPlayer(String tagPlayer) {
    if (tagPlayer == playerModelController.tagPlayer1) {
      return enumPlayer.PLAYER1;
    } else if (tagPlayer == playerModelController.tagPlayer2) {
      return enumPlayer.PLAYER2;
    } else {
      return enumPlayer.TIED;
    }
  }

  void setWinnerPlayer(String player) {
    playerModelController.winnerPlayer = getWinnerPlayer(player);
  }

  bool getResultLine1() {
    if (playerModelController.a1 != null &&
        playerModelController.a1 == playerModelController.a2 &&
        playerModelController.a2 == playerModelController.a3) return true;
    return false;
  }

  bool getResultLine2() {
    if (playerModelController.b1 != null &&
        playerModelController.b1 == playerModelController.b2 &&
        playerModelController.b2 == playerModelController.b3) return true;
    return false;
  }

  bool getResultLine3() {
    if (playerModelController.c1 != null &&
        playerModelController.c1 == playerModelController.c2 &&
        playerModelController.c2 == playerModelController.c3) return true;
    return false;
  }

  bool getResultColumn1() {
    if (playerModelController.a1 != null &&
        playerModelController.a1 == playerModelController.b1 &&
        playerModelController.b1 == playerModelController.c1) return true;
    return false;
  }

  bool getResultColumn2() {
    if (playerModelController.a2 != null &&
        playerModelController.a2 == playerModelController.b2 &&
        playerModelController.b2 == playerModelController.c2) return true;
    return false;
  }

  bool getResultColumn3() {
    if (playerModelController.a3 != null &&
        playerModelController.a3 == playerModelController.b3 &&
        playerModelController.b3 == playerModelController.c3) return true;
    return false;
  }

  bool getResultDiagonalA1C3() {
    if (playerModelController.a1 != null &&
        playerModelController.a1 == playerModelController.b2 &&
        playerModelController.b2 == playerModelController.c3) return true;
    return false;
  }

  bool getResultDiagonalA3C1() {
    if (playerModelController.a3 != null &&
        playerModelController.a3 == playerModelController.b2 &&
        playerModelController.b2 == playerModelController.c1) return true;
    return false;
  }

  bool getResultTied() {
    if (playerModelController.winnerPlayer == null && getStatusGameFinish()) {
      return true;
    }
    return false;
  }

  bool getStatusGameFinish() {
    if (playerModelController.a1 != null &&
        playerModelController.a2 != null &&
        playerModelController.a3 != null &&
        playerModelController.b1 != null &&
        playerModelController.b2 != null &&
        playerModelController.b3 != null &&
        playerModelController.c1 != null &&
        playerModelController.c2 != null &&
        playerModelController.c3 != null) return true;
    return false;
  }

/*
** ANIMAÇÕES
*/

  void setValuesAnimationLine({
    double alignX = 0,
    double alignY = 0,
    double rotation = 0,
  }) {
    lineAnimationAlignmentX = alignX;
    lineAnimationAlignmentY = alignY;
    lineAnimationRotation = rotation;
  }
}
