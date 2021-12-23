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
    switch (color) {
      case 'purple':
        return Colors.purple;
      case 'amber':
        return Colors.amber;
      case 'pink':
        return Colors.pink;
      case 'cyan':
        return Colors.cyan;
      case 'deepOrange':
        return Colors.deepOrange;
      case 'green':
        return Colors.green.shade800;
    }
    return Colors.white;
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
            // Image.network(
            //   "http://pa1.narvii.com/6841/c3a294729b51aca6a3f04a77defef886d703e205_00.gif",
            // ),
            Image.network(
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
                    onTap: () => toggleColor('purple'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('purple'),
                        height: getSizeCircle('purple'),
                        width: getSizeCircle('purple'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('amber'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('amber'),
                        height: getSizeCircle('amber'),
                        width: getSizeCircle('amber'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('pink'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('pink'),
                        height: getSizeCircle('pink'),
                        width: getSizeCircle('pink'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('cyan'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('cyan'),
                        height: getSizeCircle('cyan'),
                        width: getSizeCircle('cyan'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('deepOrange'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('deepOrange'),
                        height: getSizeCircle('deepOrange'),
                        width: getSizeCircle('deepOrange'),
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => toggleColor('green'),
                    child: ClipOval(
                      child: AnimatedContainer(
                        color: getColorSelected('green'),
                        height: getSizeCircle('green'),
                        width: getSizeCircle('green'),
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
                    text: 'Digite seu nome ou apelido',
                  );
                } else if (colorSelected == '') {
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
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
