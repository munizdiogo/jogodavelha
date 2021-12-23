import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/jogo_controller.dart';

class JogadoresComponents extends StatefulWidget {
  final JogoController jogoController;
  const JogadoresComponents({
    Key? key,
    required this.jogoController,
  }) : super(key: key);

  @override
  _JogadoresComponentsState createState() => _JogadoresComponentsState();
}

class _JogadoresComponentsState extends State<JogadoresComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 36,
              ),
            ),
            Text(widget.jogoController.nomeJogador1),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 36,
              ),
            ),
            Text('Apelido Jogador 2'),
          ],
        ),
      ],
    );
  }
}
