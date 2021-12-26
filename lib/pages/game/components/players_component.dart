import 'package:flutter/material.dart';
import 'package:jogodavelha/constants.dart';
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
    var winer = playerController.playerModelController.winnerPlayer;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      child: Icon(
                        Icons.person,
                        size: 42,
                        color: Constants.mapColors[playerController
                            .playerModelController.colorPlayer1],
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.yellowAccent,
                        size: winer == enumPlayer.PLAYER1 ? 50 : 0,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    playerController.playerModelController.namePlayer1,
                    style: TextStyle(
                      color: Constants.mapColors[
                          playerController.playerModelController.colorPlayer1],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            if (winer != null && winer != enumPlayer.TIED)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: winer == enumPlayer.PLAYER1
                    ? const TextWiner()
                    : const TextLoser(),
              ),
          ],
        ),
        Row(
          children: [
            if (winer != null && winer != enumPlayer.TIED)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: winer == enumPlayer.PLAYER2
                    ? const TextWiner()
                    : const TextLoser(),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      child: Icon(
                        Icons.person,
                        size: 42,
                        color: winer != null
                            ? Constants.mapColors[playerController
                                .playerModelController.colorPlayer2]
                            : Colors.white,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.yellowAccent,
                        size: winer == enumPlayer.PLAYER2 ? 50 : 0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    playerController.playerModelController.namePlayer2 ??
                        'Jogador 2',
                    style: TextStyle(
                      color:
                          playerController.playerModelController.namePlayer2 !=
                                  null
                              ? Constants.mapColors[playerController
                                  .playerModelController.colorPlayer2]
                              : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TextWiner extends StatelessWidget {
  const TextWiner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'GANHOU',
      style: TextStyle(
        fontSize: 24,
        color: Colors.lightGreen,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextLoser extends StatelessWidget {
  const TextLoser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'PERDEU',
      style: TextStyle(
        fontSize: 24,
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
