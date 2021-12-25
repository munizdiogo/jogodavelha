import 'package:flutter/cupertino.dart';
import 'package:jogodavelha/models/player_model.dart';

class PlayerController with ChangeNotifier {
  PlayerModel playerModelController = PlayerModel(
    activePlayer: enumPlayer.PLAYER1,
    namePlayer1: '',
  );

  void createGame(PlayerModel playerModel) {
    playerModelController = playerModel;
    notifyListeners();
  }

  enumPlayer getWinnerPlayer(String tagPlayer) {
    if (tagPlayer == playerModelController.tagPlayer1) {
      return enumPlayer.PLAYER1;
    } else if (tagPlayer == playerModelController.tagPlayer2) {
      return enumPlayer.PLAYER2;
    } else {
      return enumPlayer.TIED;
    }
  }

  void updateController() {
    notifyListeners();
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
    if (playerModelController.a3 != null &&
        playerModelController.a3 == playerModelController.b3 &&
        playerModelController.b3 == playerModelController.c3) return true;
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
}
