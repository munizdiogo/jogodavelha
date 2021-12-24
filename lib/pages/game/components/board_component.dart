import 'package:flutter/material.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/pages/game/components/square_component.dart';

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

  enumPlayer getWinnerPlayer(String tagPlayer) {
    return widget.playerModel.a1 == widget.playerModel.tagPlayer1
        ? enumPlayer.PLAYER1
        : enumPlayer.PLAYER2;
  }

  void verificationFinish() {
    PlayerModel playerModel = widget.playerModel;
    Alignment alignLine = Alignment.bottomRight;
    if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.a2 &&
        playerModel.a2 == playerModel.a3) {
      // LINHA 1 | A
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
      alignLine = const Alignment(0, -1.5);
      turnsRotationLine = 0.25;
    } else if (playerModel.b1 != null &&
        playerModel.b1 == playerModel.b2 &&
        playerModel.b2 == playerModel.b3) {
      // LINHA 2 | B
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.b1!);
      alignLine = const Alignment(0, 0);
      turnsRotationLine = 0.25;
    } else if (playerModel.c1 != null &&
        playerModel.c1 == playerModel.c2 &&
        playerModel.c2 == playerModel.c3) {
      // LINHA 3 | C
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.c1!);
      alignLine = const Alignment(0, 1.5);
      turnsRotationLine = 0.25;
    } else if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.b1 &&
        playerModel.b1 == playerModel.c1) {
      // COLUNA 1
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
      alignLine = const Alignment(-0.6, 0);
      turnsRotationLine = 0;
    } else if (playerModel.a2 != null &&
        playerModel.a2 == playerModel.b2 &&
        playerModel.b2 == playerModel.c2) {
      // COLUNA 2
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a2!);
      alignLine = const Alignment(0, 0);
      turnsRotationLine = 0;
    } else if (playerModel.a3 != null &&
        playerModel.a3 == playerModel.b3 &&
        playerModel.b3 == playerModel.c3) {
      // COLUNA 3
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a3!);
      alignLine = const Alignment(0.6, 0);
      turnsRotationLine = 0;
    } else if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.b2 &&
        playerModel.b2 == playerModel.c3) {
      // DIAGONAL ESQUEDAR PARA DIREITA | LR
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
      alignLine = const Alignment(0, 0);
      turnsRotationLine = -0.13;
    } else if (playerModel.a3 != null &&
        playerModel.a3 == playerModel.b2 &&
        playerModel.b2 == playerModel.c1) {
      // DIAGONAL DIREITA PARA ESQUERDA | RL
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a3!);
      alignLine = const Alignment(0, -0);
      turnsRotationLine = 0.13;
    } else if (playerModel.winnerPlayer == null &&
        (playerModel.a1 != null &&
            playerModel.a2 != null &&
            playerModel.a3 != null &&
            playerModel.b1 != null &&
            playerModel.b2 != null &&
            playerModel.b3 != null &&
            playerModel.c1 != null &&
            playerModel.c2 != null &&
            playerModel.c3 != null)) {
      // EMPATE | TIED
      playerModel.winnerPlayer = enumPlayer.TIED;
      alignLine = Alignment.bottomRight;
    }

    if (playerModel.winnerPlayer != null &&
        playerModel.winnerPlayer != enumPlayer.TIED) {
      setState(() {
        alignmentLineAnimation = alignLine;
        controllerLineFinish.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerLineFinish.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorLine = Theme.of(context).primaryColorLight;

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
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'a2',
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'a3',
                          playerModel: widget.playerModel,
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
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'b2',
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'b3',
                          playerModel: widget.playerModel,
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
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'c2',
                          playerModel: widget.playerModel,
                          callback: verificationFinish,
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        SquareComponent(
                          id: 'c3',
                          playerModel: widget.playerModel,
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
                            color: Colors.green,
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
