import 'package:flutter/material.dart';
import 'package:jogodavelha/pages/game/game_page.dart';
import 'package:jogodavelha/routes/routes.dart' as route;

import 'pages/room/room_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RoomPage(),
      darkTheme: ThemeData.dark(),
      routes: {
        route.ROOM: (context) => const RoomPage(),
        route.GAME: (context) => const GamePage(),
      },
    );
  }
}
