import 'package:flutter/material.dart';
import 'package:jogodavelha/constants.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/routes/routes.dart' as route;
import 'package:provider/provider.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> with TickerProviderStateMixin {
  late PlayerModel playerModel;
  TextEditingController textEditingController = TextEditingController();
  String colorSelected = '';
  late AnimationController controllerTextJogoAnimation;
  late Animation<Size?> sizeTextJogoAnimation;

  @override
  void initState() {
    super.initState();
    controllerTextJogoAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    sizeTextJogoAnimation = SizeTween(
      begin: const Size(0, 0),
      end: const Size(20, 300),
    ).animate(controllerTextJogoAnimation);
  }

  void toggleColor(String color) {
    setState(() {
      colorSelected = color;
    });
  }

  Color getColorSelected(String color) {
    var mapColor = Constants.mapColors[color];
    return mapColor ?? Colors.white;
  }

  double getSizeCircle(String color) {
    return color == colorSelected
        ? Constants.sizeBigCircleColor
        : Constants.sizeSmallCircleColor;
  }

  @override
  Widget build(BuildContext context) {
    var playerController = Provider.of<PlayerController>(context);
    controllerTextJogoAnimation.forward();

    bool validatePlayer() {
      if (textEditingController.text.isEmpty) {
        showMessageValidation(
          context: context,
          text: 'Digite seu apelido',
        );
        return false;
      } else if (colorSelected == '') {
        showMessageValidation(
          context: context,
          text: 'Escolha uma cor',
        );
        return false;
      } else {
        playerModel = PlayerModel(
          namePlayer1: textEditingController.text,
          colorPlayer1: colorSelected,
          activePlayer: enumPlayer.PLAYER1,
        );
        return true;
      }
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: controllerTextJogoAnimation,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: sizeTextJogoAnimation.value?.height,
                          child: const Text(
                            'J\n#\nG\n#',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        );
                      }),
                  Image.asset(
                    'assets/images/muriel.png',
                    width: 200,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: 'Digite aqui seu APELIDO',
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
                      onTap: () => toggleColor('lightGreen'),
                      child: ClipOval(
                        child: AnimatedContainer(
                          color: getColorSelected('lightGreen'),
                          height: getSizeCircle('lightGreen'),
                          width: getSizeCircle('lightGreen'),
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validatePlayer()) {
                          playerController.createGame(
                              playerModel: playerModel, typeGame: "treino");
                          Navigator.pushReplacementNamed(
                            context,
                            route.GAME,
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black54),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Modo \nTreino",
                          style:
                              TextStyle(fontSize: 18, color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validatePlayer()) {
                          playerController.createGame(
                              playerModel: playerModel, typeGame: "x1");
                          Navigator.pushReplacementNamed(
                            context,
                            route.GAME,
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "X1 contra \num  amigo",
                          style: TextStyle(fontSize: 18, color: Colors.white60),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
      onPressed: () {},
    ),
  );
}
