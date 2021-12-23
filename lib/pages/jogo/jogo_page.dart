import 'package:flutter/material.dart';
import 'package:jogodavelha/pages/jogo/components/jogadores_component.dart';
import 'package:jogodavelha/pages/jogo/components/tabuleiro_component.dart';

class JogoPage extends StatefulWidget {
  const JogoPage({Key? key}) : super(key: key);

  @override
  _JogoPageState createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          // color: Colors.amber,
          child: Column(
            children: [
              JogadoresComponents(),
              SizedBox(height: 50),
              TabuleiroComponent()
            ],
          ),
        ),
      ),
    );
  }
}
