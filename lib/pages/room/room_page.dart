import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/jogo_controller.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late JogoController jogoController;
  TextEditingController textEditingController = TextEditingController();
  String corSelected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //   "http://pa1.narvii.com/6841/c3a294729b51aca6a3f04a77defef886d703e205_00.gif",
            // ),
            Image.network(
              "https://static.wikia.nocookie.net/coragem/images/9/95/Muriel.png/revision/latest/top-crop/width/360/height/450?cb=20130423151854&path-prefix=pt-br",
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
            SizedBox(height: 20),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child:
                        Container(color: Colors.purple, height: 32, width: 32),
                  ),
                  ClipOval(
                    child:
                        Container(color: Colors.amber, height: 32, width: 32),
                  ),
                  ClipOval(
                    child: Container(color: Colors.pink, height: 32, width: 32),
                  ),
                  ClipOval(
                    child: Container(color: Colors.cyan, height: 32, width: 32),
                  ),
                  ClipOval(
                    child: Container(
                        color: Colors.deepOrange, height: 32, width: 32),
                  ),
                  ClipOval(
                    child: Container(
                        color: Colors.green.shade800, height: 32, width: 32),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.isEmpty) {
                  showMessageValidation(
                    context: context,
                    text: 'Digite seu nome ou apelido',
                  );
                } else if (corSelected == '') {
                  showMessageValidation(
                    context: context,
                    text: 'Escolha uma cor',
                  );
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Criar jogo"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showMessageValidation({required context, required text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    snackBarValidationComponent(text: text),
  );
}

SnackBar snackBarValidationComponent({String text = ''}) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    action: SnackBarAction(
      textColor: Colors.black45,
      label: 'X',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
