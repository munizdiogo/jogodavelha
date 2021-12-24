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

  void verificationFinish() {
    setState(() {
      alignmentDirectionalStack = AlignmentDirectional.centerEnd;
    });
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
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'a2',
                        playerModel: widget.playerModel,
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'a3',
                        playerModel: widget.playerModel,
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
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'b2',
                        playerModel: widget.playerModel,
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'b3',
                        playerModel: widget.playerModel,
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
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'c2',
                        playerModel: widget.playerModel,
                      ),
                      Container(height: 110, width: 4, color: colorLine),
                      SquareComponent(
                        id: 'c3',
                        playerModel: widget.playerModel,
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
