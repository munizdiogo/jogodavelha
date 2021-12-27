import 'package:flutter/material.dart';
import 'package:jogodavelha/constants.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:provider/provider.dart';

class SquareComponent extends StatefulWidget {
  final String id;
  const SquareComponent({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SquareComponent> createState() => _SquareComponentState();
}

class _SquareComponentState extends State<SquareComponent> {
  bool isSelected = true;
  late String tagPlayer;
  late Color colorTagPlayer;

  @override
  // ignore: must_call_super
  initState() {
    tagPlayer = '';
    colorTagPlayer = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var playerController = Provider.of<PlayerController>(context);
    var playerModelController = playerController.playerModelController;

    void showTag({required String idSquare}) {
      if ((idSquare == 'a1' && playerModelController.a1 != null) ||
          (idSquare == 'a2' && playerModelController.a2 != null) ||
          (idSquare == 'a3' && playerModelController.a3 != null) ||
          (idSquare == 'b1' && playerModelController.b1 != null) ||
          (idSquare == 'b2' && playerModelController.b2 != null) ||
          (idSquare == 'b3' && playerModelController.b3 != null) ||
          (idSquare == 'c1' && playerModelController.c1 != null) ||
          (idSquare == 'c2' && playerModelController.c2 != null) ||
          (idSquare == 'c3' && playerModelController.c3 != null)) {
        return null;
      }

      setState(() {
        if (playerModelController.activePlayer == enumPlayer.PLAYER1) {
          tagPlayer = playerModelController.tagPlayer1;
          colorTagPlayer =
              Constants.mapColors[playerModelController.colorPlayer1] ??
                  Colors.white;
        } else {
          tagPlayer = playerModelController.tagPlayer2;
          colorTagPlayer =
              Constants.mapColors[playerModelController.colorPlayer2] ??
                  Colors.white;
        }
        if (idSquare == 'a1' && playerModelController.a1 == null) {
          print('passei aqui heheheh');
          playerController.playerModelController.a1 = tagPlayer;
        } else if (idSquare == 'a2') {
          playerController.playerModelController.a2 = tagPlayer;
        } else if (idSquare == 'a3') {
          playerController.playerModelController.a3 = tagPlayer;
        } else if (idSquare == 'b1') {
          playerController.playerModelController.b1 = tagPlayer;
        } else if (idSquare == 'b2') {
          playerController.playerModelController.b2 = tagPlayer;
        } else if (idSquare == 'b3') {
          playerController.playerModelController.b3 = tagPlayer;
        } else if (idSquare == 'c1') {
          playerController.playerModelController.c1 = tagPlayer;
        } else if (idSquare == 'c2') {
          playerController.playerModelController.c2 = tagPlayer;
        } else if (idSquare == 'c3') {
          playerController.playerModelController.c3 = tagPlayer;
        }
        if (playerModelController.autoChangePlayer) {
          if (playerModelController.activePlayer == enumPlayer.PLAYER1) {
            playerController.playerModelController.activePlayer =
                enumPlayer.PLAYER2;
          } else {
            playerController.playerModelController.activePlayer =
                enumPlayer.PLAYER1;
          }
        }
        playerController.verificationGameFinish();
      });
      if (playerController.typeGame == 'x1') {
        playerController.sendInfoGame();
        playerController.getInfoMoveGame();
      }
      playerController.updateController();
    }

    return InkWell(
      onTap: () =>
          playerController.playerModelController.winnerPlayer == null &&
                  playerController.playerModelController.winnerPlayer !=
                      enumPlayer.TIED
              ? showTag(idSquare: widget.id)
              : null,
      child: Container(
        child: isSelected
            ? Center(
                child: Text(
                  tagPlayer,
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: colorTagPlayer,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(),
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(5),
      ),
    );
  }
}
