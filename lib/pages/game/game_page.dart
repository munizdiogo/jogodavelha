import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/pages/game/components/players_component.dart';
import 'package:jogodavelha/pages/game/components/board_component.dart';
import 'package:jogodavelha/routes/routes.dart' as route;
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    var playerController = Provider.of<PlayerController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayersComponents(
                    playerModel: playerController.playerModelController),
                BoardComponent(
                    playerModel: playerController.playerModelController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(route.ROOM);
                      },
                      child: const Text('Sair do Jogo'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          var playerModelNew = PlayerModel(
                              autoChangePlayer: playerController
                                  .playerModelController.autoChangePlayer,
                              namePlayer1: playerController
                                  .playerModelController.namePlayer1,
                              colorPlayer1: playerController
                                  .playerModelController.colorPlayer1,
                              activePlayer: enumPlayer.PLAYER1);

                          playerController.createGame(
                              playerModel: playerModelNew,
                              typeGame: playerController.typeGame);

                          Navigator.of(context)
                              .pushReplacementNamed(route.GAME);
                        });
                      },
                      child: const Text('Reiniciar Jogo'),
                    ),
                    // Row(
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           if (playerController
                    //                   .playerModelController.activePlayer ==
                    //               enumPlayer.PLAYER1) {
                    //             playerController.playerModelController
                    //                 .activePlayer = enumPlayer.PLAYER2;
                    //           } else {
                    //             playerController.playerModelController
                    //                 .activePlayer = enumPlayer.PLAYER1;
                    //           }
                    //         });
                    //       },
                    //       child: const Text('Mudar Jogador'),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           playerController
                    //                   .playerModelController.autoChangePlayer =
                    //               !playerController
                    //                   .playerModelController.autoChangePlayer;
                    //         });
                    //       },
                    //       child: Text(
                    //         'Modo Automático',
                    //         style: TextStyle(
                    //             color: playerController
                    //                     .playerModelController.autoChangePlayer
                    //                 ? Colors.lightGreen
                    //                 : Colors.blueGrey),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
