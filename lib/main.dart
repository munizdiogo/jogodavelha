import 'package:flutter/material.dart';
import 'package:jogodavelha/pages/jogo/jogo_page.dart';

import 'pages/room/room_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
    );
  }
}
