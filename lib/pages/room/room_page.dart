import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  TextEditingController textEditingController = TextEditingController();

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
            Text('Jogo da velha'),
            SizedBox(height: 50),
            Container(
              width: 300,
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Nome ou Apelido',
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
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
