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

  @override
  // ignore: must_call_super
  void initState() {
    controllerLineFinish = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    sizeLineFinishAnimation = SizeTween(
      begin: const Size(0, 0),
      end: const Size(0, 0),
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

    alignmentLineAnimation = Alignment(playerController.lineAnimationAlignmentX,
        playerController.lineAnimationAlignmentY);

    if (playerController.playerModelController.gameFinished) {
      sizeLineFinishAnimation = SizeTween(
        begin: Size(playerController.sizeLineAnimation['beginWidth'] ?? 0,
            playerController.sizeLineAnimation['beginHeight'] ?? 0),
        end: Size(playerController.sizeLineAnimation['endWidth'] ?? 0,
            playerController.sizeLineAnimation['endHeight'] ?? 0),
      ).animate(controllerLineFinish);

      controllerLineFinish.forward();
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
                        const SquareComponent(
                          id: 'a1',
                        ),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'a2'),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'a3'),
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
                        const SquareComponent(id: 'b1'),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'b2'),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'b3'),
                      ],
                    ),
                    Container(height: 4, width: 340, color: colorLine),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SquareComponent(id: 'c1'),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'c2'),
                        Container(height: 110, width: 4, color: colorLine),
                        const SquareComponent(id: 'c3'),
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
                        turns: playerController.lineAnimationRotation,
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
