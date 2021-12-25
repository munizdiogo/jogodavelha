import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:provider/provider.dart';

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
    var playerController = Provider.of<PlayerController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              child: Icon(
                Icons.person,
                size: 42,
                color: playerController.playerModelController.colorPlayer1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                playerController.playerModelController.namePlayer1,
                style: TextStyle(
                  color: playerController.playerModelController.colorPlayer1,
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
              radius: 32,
              child: Icon(
                Icons.person,
                size: 42,
                color:
                    playerController.playerModelController.namePlayer2 != null
                        ? playerController.playerModelController.colorPlayer2
                        : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                playerController.playerModelController.namePlayer2 ??
                    'Jogador 2',
                style: TextStyle(
                  color:
                      playerController.playerModelController.namePlayer2 != null
                          ? playerController.playerModelController.colorPlayer2
                          : Colors.white,
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
