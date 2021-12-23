import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/jogo_controller.dart';
import 'package:jogodavelha/pages/jogo/components/celula_component.dart';

class TabuleiroComponent extends StatefulWidget {
  final JogoController jogoController;
  const TabuleiroComponent({
    Key? key,
    required this.jogoController,
  }) : super(key: key);

  @override
  _TabuleiroComponentState createState() => _TabuleiroComponentState();
}

class _TabuleiroComponentState extends State<TabuleiroComponent> {
  var startGame = false;
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
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelularComponent(
                    id: 'a1',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'a2',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'a3',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
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
                  CelularComponent(
                    id: 'b1',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'b2',
                    marcador: 'O',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'b3',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                ],
              ),
              Container(height: 4, width: 340, color: colorLine),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelularComponent(
                    id: 'c1',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'c2',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                  Container(height: 110, width: 4, color: colorLine),
                  CelularComponent(
                    id: 'c3',
                    marcador: 'X',
                    colorMarcador: widget.jogoController.corJogador1,
                  ),
                ],
              ),
            ],
          );
  }
}
