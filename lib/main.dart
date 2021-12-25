import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/pages/game/game_page.dart';
import 'package:jogodavelha/routes/routes.dart' as route;
import 'package:provider/provider.dart';

import 'pages/room/room_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlayerController(),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
