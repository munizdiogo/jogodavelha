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

    void verificationFinish() {
      Alignment alignLine = Alignment.bottomRight;
      var _playerModel = playerController.playerModelController;

      if (playerController.getResultLine1()) {
        playerController.setWinnerPlayer(_playerModel.a1!);
        alignLine = const Alignment(0, -1.5);
        turnsRotationLine = 0.25;
      } else if (playerController.getResultLine2()) {
        playerController.setWinnerPlayer(_playerModel.b1!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0.25;
      } else if (playerController.getResultLine3()) {
        playerController.setWinnerPlayer(_playerModel.c1!);
        alignLine = const Alignment(0, 1.5);
        turnsRotationLine = 0.25;
      } else if (playerController.getResultColumn1()) {
        playerController.setWinnerPlayer(_playerModel.a1!);
        alignLine = const Alignment(-0.6, 0);
        turnsRotationLine = 0;
      } else if (playerController.getResultColumn2()) {
        playerController.setWinnerPlayer(_playerModel.a2!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0;
      } else if (playerController.getResultColumn3()) {
        playerController.setWinnerPlayer(_playerModel.a3!);
        alignLine = const Alignment(0.6, 0);
        turnsRotationLine = 0;
      } else if (playerController.getResultDiagonalA1C3()) {
        playerController.setWinnerPlayer(_playerModel.a1!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = -0.13;
      } else if (playerController.getResultDiagonalA3C1()) {
        playerController.setWinnerPlayer(_playerModel.a3!);
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0.13;
      } else if (playerController.getResultTied()) {
        playerController.setWinnerPlayer('TIED');
        alignLine = const Alignment(0, 0);
        turnsRotationLine = 0;
      }

      if (_playerModel.winnerPlayer == enumPlayer.TIED) {
        print('DEU EMPATE');
        setState(() {
          alignmentLineAnimation = alignLine;
          sizeLineFinishAnimation = SizeTween(
            begin: const Size(8, 350),
            end: const Size(350, 350),
          ).animate(controllerLineFinish);
          controllerLineFinish.forward();
        });
      } else if (_playerModel.winnerPlayer != null) {
        setState(() {
          alignmentLineAnimation = alignLine;
          controllerLineFinish.forward();
        });
      }
      playerController.updateController();
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
