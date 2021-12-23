import 'package:flutter/material.dart';
import 'package:jogodavelha/constantes.dart';
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
  String colorSelected = '';

  void toggleColor(String color) {
    setState(() {
      colorSelected = color;
    });
  }

  Color getColorSelected(String color) {
    var mapColor = Constantes.mapColors[color];
    return mapColor ?? Colors.white;
  }

  String getNameColorSelected(String color) {
    var mapColor = Constantes.mapNameColors[color];
    return mapColor ?? 'white';
  }

  double getSizeCircle(String color) {
    return color == colorSelected
        ? Constantes.sizeBigCircleColor
        : Constantes.sizeSmallCircleColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              // "https://pa1.narvii.com/6894/1a24b202230db33325774bc588db9e172a1c4947r1-450-306_hq.gif",
              "https://static.wikia.nocookie.net/coragem/images/9/95/Muriel.png/revision/latest/top-crop/width/360/height/450?cb=20130423151854&path-prefix=pt-br",
              width: 200,
            ),
            const Text('Jogo da Velha'),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: textEditingController,
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Digite aqui seu apelido',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => toggleColor('color1'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color1'),
                        height: getSizeCircle('color1'),
                        width: getSizeCircle('color1'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('color2'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color2'),
                        height: getSizeCircle('color2'),
                        width: getSizeCircle('color2'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('color3'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color3'),
                        height: getSizeCircle('color3'),
                        width: getSizeCircle('color3'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('color4'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color4'),
                        height: getSizeCircle('color4'),
                        width: getSizeCircle('color4'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('color5'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color5'),
                        height: getSizeCircle('color5'),
                        width: getSizeCircle('color5'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('color6'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('color6'),
                        height: getSizeCircle('color6'),
                        width: getSizeCircle('color6'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.isEmpty) {
                  showMessageValidation(
                    context: context,
                    text: 'Digite seu apelido',
                  );
                } else if (colorSelected == '') {
                  showMessageValidation(
                    context: context,
                    text: 'Escolha uma cor',
                  );
                } else {
                  jogoController = JogoController(
                    nomeJogador1: textEditingController.text,
                    corJogador1: getColorSelected(colorSelected),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    route.JOGO,
                    arguments: jogoController,
                  );
                }
                print(textEditingController.text);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Jogar"),
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
