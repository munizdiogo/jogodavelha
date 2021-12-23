import 'package:flutter/material.dart';
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
              Row(
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
              ),
              SizedBox(height: 50),
              TabuleiroComponent()
            ],
          ),
        ),
      ),
    );
  }
}
