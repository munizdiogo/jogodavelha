import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:provider/provider.dart';

class SquareComponent extends StatefulWidget {
  final String id;
  final VoidCallback callback;
  const SquareComponent({
    Key? key,
    required this.id,
    required this.callback,
  }) : super(key: key);

  @override
  State<SquareComponent> createState() => _SquareComponentState();
}

class _SquareComponentState extends State<SquareComponent> {
  bool isSelected = false;
  late String tagPlayer;
  late Color colorTagPlayer;

  @override
  initState() {
    tagPlayer = '';
    colorTagPlayer = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var playerController = Provider.of<PlayerController>(context);
    void showTag({required String idSquare}) {
      setState(() {
        isSelected = isSelected ? isSelected : !isSelected;

        if (playerController.playerModelController.activePlayer ==
            enumPlayer.PLAYER1) {
          tagPlayer = playerController.playerModelController.tagPlayer1;
          colorTagPlayer = playerController.playerModelController.colorPlayer1;
        } else {
          tagPlayer = playerController.playerModelController.tagPlayer2;
          colorTagPlayer = playerController.playerModelController.colorPlayer2;
        }
        if (idSquare == 'a1')
          playerController.playerModelController.a1 = tagPlayer;
        if (idSquare == 'a2')
          playerController.playerModelController.a2 = tagPlayer;
        if (idSquare == 'a3')
          playerController.playerModelController.a3 = tagPlayer;
        if (idSquare == 'b1')
          playerController.playerModelController.b1 = tagPlayer;
        if (idSquare == 'b2')
          playerController.playerModelController.b2 = tagPlayer;
        if (idSquare == 'b3')
          playerController.playerModelController.b3 = tagPlayer;
        if (idSquare == 'c1')
          playerController.playerModelController.c1 = tagPlayer;
        if (idSquare == 'c2')
          playerController.playerModelController.c2 = tagPlayer;
        if (idSquare == 'c3')
          playerController.playerModelController.c3 = tagPlayer;
        widget.callback();

        if (playerController.playerModelController.autoChangePlayer) {
          if (playerController.playerModelController.activePlayer ==
              enumPlayer.PLAYER1) {
            playerController.playerModelController.activePlayer =
                enumPlayer.PLAYER2;
          } else {
            playerController.playerModelController.activePlayer =
                enumPlayer.PLAYER1;
          }
        }
      });
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
