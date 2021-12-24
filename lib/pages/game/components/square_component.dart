import 'package:flutter/material.dart';
import 'package:jogodavelha/models/player_model.dart';

class SquareComponent extends StatefulWidget {
  final String id;
  final PlayerModel playerModel;
  const SquareComponent({
    Key? key,
    required this.id,
    required this.playerModel,
  }) : super(key: key);

  @override
  State<SquareComponent> createState() => _SquareComponentState();
}

class _SquareComponentState extends State<SquareComponent> {
  bool isSelected = false;
  late String tagPlayer;
  late Color colorTagPlayer;

  initState() {
    tagPlayer = '';
    colorTagPlayer = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    void showTag({required String idSquare}) {
      setState(() {
        isSelected = isSelected ? isSelected : !isSelected;

        if (widget.playerModel.activePlayer == enumActivePlayer.PLAYER1) {
          tagPlayer = widget.playerModel.tagPlayer1;
          colorTagPlayer = widget.playerModel.colorPlayer1;
        } else {
          tagPlayer = widget.playerModel.tagPlayer2;
          colorTagPlayer = widget.playerModel.colorPlayer2;
        }
        if (idSquare == 'a1') widget.playerModel.a1 = tagPlayer;
        if (idSquare == 'a2') widget.playerModel.a2 = tagPlayer;
        if (idSquare == 'a3') widget.playerModel.a3 = tagPlayer;
        if (idSquare == 'b1') widget.playerModel.b1 = tagPlayer;
        if (idSquare == 'b2') widget.playerModel.b2 = tagPlayer;
        if (idSquare == 'b3') widget.playerModel.b3 = tagPlayer;
        if (idSquare == 'c1') widget.playerModel.c1 = tagPlayer;
        if (idSquare == 'c2') widget.playerModel.c2 = tagPlayer;
        if (idSquare == 'c3') widget.playerModel.c3 = tagPlayer;
      });
    }

    return InkWell(
      onTap: () {
        showTag(idSquare: widget.id);
        print(widget.id);
      },
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
