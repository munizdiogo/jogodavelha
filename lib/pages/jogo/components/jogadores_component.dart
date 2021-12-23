import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_model.dart';

class JogadoresComponents extends StatefulWidget {
  final PlayerModel playerModel;
  const JogadoresComponents({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  _JogadoresComponentsState createState() => _JogadoresComponentsState();
}

class _JogadoresComponentsState extends State<JogadoresComponents> {
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
                color: widget.playerModel.colorJogador1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.playerModel.namePlayer1,
                style: TextStyle(
                  color: widget.playerModel.colorJogador1,
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
                color: widget.playerModel.colorJogador2,
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.playerModel.namePlayer2 ?? 'Jogador 2',
                style: TextStyle(
                  color: widget.playerModel.colorJogador2,
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
