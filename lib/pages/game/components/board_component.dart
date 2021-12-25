import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/pages/game/components/square_component.dart';
import 'package:provider/provider.dart';

class BoardComponent extends StatefulWidget {
  final PlayerModel playerModel;
  const BoardComponent({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  _BoardComponentState createState() => _BoardComponentState();
}

class _BoardComponentState extends State<BoardComponent>
    with TickerProviderStateMixin {
  bool startGame = true;
  bool isFinished = false;
  late AnimationController controllerLineFinish;
  late Animation<Size?> sizeLineFinishAnimation;
  Alignment alignmentLineAnimation = const Alignment(0, 0);
  double turnsRotationLine = 0;

  @override
  // ignore: must_call_super
  void initState() {
    controllerLineFinish = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    sizeLineFinishAnimation = SizeTween(
      begin: const Size(0, 0),
      end: const Size(8, 350),
    ).animate(controllerLineFinish);
  }

  @override
  void dispose() {
    super.dispose();
    controllerLineFinish.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorLine = Theme.of(context).primaryColorLight;
    var playerController = Provider.of<PlayerController>(context);

    enumPlayer getWinnerPlayer(String tagPlayer) {
      var winer = tagPlayer == playerController.playerModelController.tagPlayer1
          ? enumPlayer.PLAYER1
          : enumPlayer.PLAYER2;
      print(winer);
      return winer;
    }

    void verificationFinish() {
      Alignment alignLine = Alignment.bottomRight;
      if (playerController.playerModelController.a1 != null &&
          playerController.playerModelController.a1 ==
              playerController.playerModelController.a2 &&
          playerController.playerModelController.a2 ==
              playerController.playerModelController.a3) {
        // LINHA 1 | A
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a1!);
        alignLine = const Alignment(0, -1.5);
        turnsRotationLine = 0.25;
      } else if (playerController.playerModelController.b1 != null &&
          playerController.playerModelController.b1 ==
              playerController.playerModelController.b2 &&
          playerController.playerModelController.b2 ==
              playerController.playerModelController.b3) {
        // LINHA 2 | B
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.b1!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0.25;
      } else if (playerController.playerModelController.c1 != null &&
          playerController.playerModelController.c1 ==
              playerController.playerModelController.c2 &&
          playerController.playerModelController.c2 ==
              playerController.playerModelController.c3) {
        // LINHA 3 | C
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.c1!);
        alignLine = const Alignment(0, 1.5);
        turnsRotationLine = 0.25;
      } else if (playerController.playerModelController.a1 != null &&
          playerController.playerModelController.a1 ==
              playerController.playerModelController.b1 &&
          playerController.playerModelController.b1 ==
              playerController.playerModelController.c1) {
        // COLUNA 1
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a1!);
        alignLine = const Alignment(-0.6, 0);
        turnsRotationLine = 0;
      } else if (playerController.playerModelController.a2 != null &&
          playerController.playerModelController.a2 ==
              playerController.playerModelController.b2 &&
          playerController.playerModelController.b2 ==
              playerController.playerModelController.c2) {
        // COLUNA 2
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a2!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0;
      } else if (playerController.playerModelController.a3 != null &&
          playerController.playerModelController.a3 ==
              playerController.playerModelController.b3 &&
          playerController.playerModelController.b3 ==
              playerController.playerModelController.c3) {
        // COLUNA 3
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a3!);
        alignLine = const Alignment(0.6, 0);
        turnsRotationLine = 0;
      } else if (playerController.playerModelController.a1 != null &&
          playerController.playerModelController.a1 ==
              playerController.playerModelController.b2 &&
          playerController.playerModelController.b2 ==
              playerController.playerModelController.c3) {
        // DIAGONAL ESQUEDAR PARA DIREITA | LR
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a1!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = -0.13;
      } else if (playerController.playerModelController.a3 != null &&
          playerController.playerModelController.a3 ==
              playerController.playerModelController.b2 &&
          playerController.playerModelController.b2 ==
              playerController.playerModelController.c1) {
        // DIAGONAL DIREITA PARA ESQUERDA | RL
        playerController.playerModelController.winnerPlayer =
            getWinnerPlayer(playerController.playerModelController.a3!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0.13;
      } else if (playerController.playerModelController.winnerPlayer == null &&
          (playerController.playerModelController.a1 != null &&
              playerController.playerModelController.a2 != null &&
              playerController.playerModelController.a3 != null &&
              playerController.playerModelController.b1 != null &&
              playerController.playerModelController.b2 != null &&
              playerController.playerModelController.b3 != null &&
              playerController.playerModelController.c1 != null &&
              playerController.playerModelController.c2 != null &&
              playerController.playerModelController.c3 != null)) {
        // EMPATE | TIED
        playerController.playerModelController.winnerPlayer = enumPlayer.TIED;
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0;
      }

      if (playerController.playerModelController.winnerPlayer ==
          enumPlayer.TIED) {
        setState(() {
          alignmentLineAnimation = alignLine;
          sizeLineFinishAnimation = SizeTween(
            begin: const Size(8, 350),
            end: const Size(350, 350),
          ).animate(controllerLineFinish);
          controllerLineFinish.forward();
        });
      } else if (playerController.playerModelController.winnerPlayer != null) {
        setState(() {
          alignmentLineAnimation = alignLine;
          controllerLineFinish.forward();
        });
        playerController.updateController();
      }
    }

    return !startGame
        ? TextButton(
            onPressed: () {
              setState(() {
                startGame = true;
              });
            },
            // ignore: prefer_const_constructors
            child: Text(
              'Iniciar Jogo',
              style: const TextStyle(fontSize: 36),
            ),
          )
        : SizedBox(
            height: 500,
            width: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareComponent(
                          id: 'a1',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'a2',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'a3',
                          callback: verificationFinish,
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      height: 4,
                      width: startGame ? 340 : 0,
                      color: colorLine,
                      duration: const Duration(seconds: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareComponent(
                          id: 'b1',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'b2',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'b3',
                          callback: verificationFinish,
                        ),
                      ],
                    ),
                    Container(height: 4, width: 340, color: colorLine),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareComponent(
                          id: 'c1',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'c2',
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'c3',
                          callback: verificationFinish,
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: alignmentLineAnimation,
                  child: AnimatedBuilder(
                    animation: controllerLineFinish,
                    builder: (context, child) {
                      return AnimatedRotation(
                        duration: const Duration(microseconds: 10),
                        turns: turnsRotationLine,
                        child: SizedBox(
                          child: Container(
                            child: playerController
                                        .playerModelController.winnerPlayer ==
                                    enumPlayer.TIED
                                ? const Center(
                                    child: Text(
                                      'DEU VELHA',
                                      style: TextStyle(
                                          fontSize: 42,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                            color: playerController
                                        .playerModelController.winnerPlayer ==
                                    enumPlayer.TIED
                                ? Colors.black54
                                : Colors.green,
                          ),
                          height: sizeLineFinishAnimation.value?.height,
                          width: sizeLineFinishAnimation.value?.width,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
