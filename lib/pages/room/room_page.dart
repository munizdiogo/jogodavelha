import 'package:flutter/material.dart';
import 'package:jogodavelha/constants.dart';
import 'package:jogodavelha/models/player_model.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

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
    // TODO: implement initState
    super.initState();
    controllerTextJogoAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    sizeTextJogoAnimation = SizeTween(
      begin: Size(0, 0),
      end: Size(20, 300),
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

  String getNameColorSelected(String color) {
    var mapColor = Constants.mapNameColors[color];
    return mapColor ?? 'white';
  }

  double getSizeCircle(String color) {
    return color == colorSelected
        ? Constants.sizeBigCircleColor
        : Constants.sizeSmallCircleColor;
  }

  @override
  Widget build(BuildContext context) {
    controllerTextJogoAnimation.forward();
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
                        return Container(
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
                  Image.network(
                    "https://static.wikia.nocookie.net/coragem/images/9/95/Muriel.png/revision/latest/top-crop/width/360/height/450?cb=20130423151854&path-prefix=pt-br",
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
                    playerModel = PlayerModel(
                        namePlayer1: textEditingController.text,
                        colorPlayer1: getColorSelected(colorSelected),
                        activePlayer: enumPlayer.PLAYER1);
                    Navigator.pushReplacementNamed(
                      context,
                      route.GAME,
                      arguments: playerModel,
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Jogar"),
                ),
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
