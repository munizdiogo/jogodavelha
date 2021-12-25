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

  void updateController() {
    notifyListeners();
  }
}
