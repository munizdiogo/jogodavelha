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
                color: widget.jogoController.corJogador1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.jogoController.nomeJogador1,
                style: TextStyle(
                  color: widget.jogoController.corJogador1,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 36,
                color: widget.jogoController.corJogador2 ??
                    Theme.of(context).textSelectionTheme.selectionColor,
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.jogoController.nomeJogador2 ?? 'Jogador 2',
                style: TextStyle(
                  color: widget.jogoController.corJogador2 ??
                      Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
