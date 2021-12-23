import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/jogo_controller.dart';
import 'package:jogodavelha/pages/jogo/components/jogadores_component.dart';
import 'package:jogodavelha/pages/jogo/components/tabuleiro_component.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

class JogoPage extends StatefulWidget {
  const JogoPage({Key? key}) : super(key: key);

  @override
  _JogoPageState createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  Widget build(BuildContext context) {
    var jogoController =
        ModalRoute.of(context)!.settings.arguments as JogoController;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JogadoresComponents(jogoController: jogoController),
              TabuleiroComponent(jogoController: jogoController),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(route.ROOM);
                },
                child: Text('Sair do jogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
