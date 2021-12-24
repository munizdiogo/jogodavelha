import 'package:flutter/material.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/pages/game/components/players_component.dart';
import 'package:jogodavelha/pages/game/components/board_component.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    var playerModel = ModalRoute.of(context)!.settings.arguments as PlayerModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayersComponents(playerModel: playerModel),
              BoardComponent(playerModel: playerModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(route.ROOM);
                    },
                    child: Text('Sair do jogo'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (playerModel.activePlayer ==
                            enumActivePlayer.PLAYER1) {
                          playerModel.activePlayer = enumActivePlayer.PLAYER2;
                        } else {
                          playerModel.activePlayer = enumActivePlayer.PLAYER1;
                        }

                        print(playerModel.activePlayer);
                      });
                    },
                    child: Text('Mudar Player'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
