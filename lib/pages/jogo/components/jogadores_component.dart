import 'package:flutter/material.dart';

class JogadoresComponents extends StatefulWidget {
  const JogadoresComponents({Key? key}) : super(key: key);

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
            Text('Apelido Jogador 1'),
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
