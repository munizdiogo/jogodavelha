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
  late AlignmentDirectional alignmentDirectionalStack;

  @override
  // ignore: must_call_super
  void initState() {
    alignmentDirectionalStack = AlignmentDirectional.center;

    controllerLineFinish = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    sizeLineFinishAnimation = SizeTween(
      begin: const Size(0, 0),
      end: const Size(8, 340),
    ).animate(controllerLineFinish);
  }

  enumPlayer getWinnerPlayer(String tagPlayer) {
    return widget.playerModel.a1 == widget.playerModel.tagPlayer1
        ? enumPlayer.PLAYER1
        : enumPlayer.PLAYER2;
  }

  void verificationFinish() {
    PlayerModel playerModel = widget.playerModel;
    if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.a2 &&
        playerModel.a2 == playerModel.a3) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
    } else if (playerModel.b1 != null &&
        playerModel.b1 == playerModel.b2 &&
        playerModel.b2 == playerModel.b3) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.b1!);
    } else if (playerModel.c1 != null &&
        playerModel.c1 == playerModel.c2 &&
        playerModel.c2 == playerModel.c3) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.c1!);
    } else if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.b1 &&
        playerModel.b1 == playerModel.c1) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
    } else if (playerModel.a2 != null &&
        playerModel.a2 == playerModel.b2 &&
        playerModel.b2 == playerModel.c2) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a2!);
    } else if (playerModel.a3 != null &&
        playerModel.a3 == playerModel.b3 &&
        playerModel.b3 == playerModel.c3) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a3!);
    } else if (playerModel.a1 != null &&
        playerModel.a1 == playerModel.b2 &&
        playerModel.b2 == playerModel.c3) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.a1!);
    } else if (playerModel.c3 != null &&
        playerModel.c3 == playerModel.b2 &&
        playerModel.b2 == playerModel.a1) {
      playerModel.winnerPlayer = getWinnerPlayer(playerModel.c3!);
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
      playerModel.winnerPlayer = enumPlayer.TIED;
    }
    print(playerModel.winnerPlayer);
    if (playerModel.winnerPlayer != null &&
        playerModel.winnerPlayer != enumPlayer.TIED) {
      setState(() {
        alignmentDirectionalStack = AlignmentDirectional.centerEnd;
        controllerLineFinish.forward();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            child: Text(
              'Iniciar Jogo',
              style: TextStyle(fontSize: 36),
            ),
          )
        : Stack(
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
                    duration: Duration(seconds: 2),
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
              Center(
                child: Container(
                  width: 340,
                  child: Align(
                    alignment: alignmentDirectionalStack,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: AnimatedBuilder(
                          animation: controllerLineFinish,
                          builder: (context, child) {
                            return Container(
                              color: Colors.green,
                              height: sizeLineFinishAnimation.value?.height,
                              width: sizeLineFinishAnimation.value?.width,
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
