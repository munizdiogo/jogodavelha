import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/jogo_controller.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  TextEditingController textEditingController = TextEditingController();
  late JogoController jogoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn.pixabay.com/photo/2019/05/06/18/49/mother-4183895_960_720.png",
              width: 200,
            ),
            Text('Jogo da Velha'),
            SizedBox(height: 50),
            Container(
              width: 300,
              child: TextFormField(
                controller: textEditingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Nome ou Apelido',
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: const Text('Digite seu nome ou apelido'),
                  action: SnackBarAction(
                    textColor: Colors.black45,
                    label: 'X',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                if (textEditingController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  jogoController = JogoController(
                    nomeJogador1: textEditingController.text,
                    corJogador1: Colors.purpleAccent,
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    route.JOGO,
                    arguments: jogoController,
                  );
                }
                print(textEditingController.text);
              },
              child: Text("Criar jogo"),
            )
          ],
        ),
      ),
    );
  }
}
