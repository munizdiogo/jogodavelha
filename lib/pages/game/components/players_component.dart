import 'package:flutter/material.dart';
import 'package:jogodavelha/models/player_model.dart';

class PlayersComponents extends StatefulWidget {
  final PlayerModel playerModel;
  const PlayersComponents({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  _PlayersComponentsState createState() => _PlayersComponentsState();
}

class _PlayersComponentsState extends State<PlayersComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 36,
                color: widget.playerModel.colorPlayer1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.playerModel.namePlayer1,
                style: TextStyle(
                  color: widget.playerModel.colorPlayer1,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 36,
                color: widget.playerModel.colorPlayer2,
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.playerModel.namePlayer2 ?? 'Jogador 2',
                style: TextStyle(
                  color: widget.playerModel.colorPlayer2,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
