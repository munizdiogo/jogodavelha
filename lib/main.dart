import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_controller.dart';
import 'package:jogodavelha/pages/game/game_page.dart';
import 'package:jogodavelha/routes/routes.dart' as route;
import 'package:provider/provider.dart';

import 'pages/room/room_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBEPMhSDhsKnB3wx65kP7xfgvwJ-HHzTZU",
        authDomain: "jogodavelha-e228e.firebaseapp.com",
        projectId: "jogodavelha-e228e",
        storageBucket: "jogodavelha-e228e.appspot.com",
        messagingSenderId: "202602780813",
        appId: "1:202602780813:web:bf04ddbda3a2fdc120eac4",
        measurementId: "G-0KVLG132GF"),
  );

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
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                const Center(
                  child: Text(
                      "Ops! Ocorreu um erro\n\nVerifiquei se está conectado a internet \ne tente novamente."),
                );
                print('ERROR');
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return const RoomPage();
              }
              return Center(
                  child: Column(
                children: const [CircularProgressIndicator()],
              ));
            }),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        routes: {
          route.ROOM: (context) => const RoomPage(),
          route.GAME: (context) => const GamePage(),
        },
      ),
    );
  }
}
