import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogodavelha/models/player_model.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference games = FirebaseFirestore.instance.collection('games');

  PlayerModel playerModel = PlayerModel();

  Future createGame({required playerModel}) {
    print('passei aqu addGame');
    return games
        .add({
          'autoChangePlayer': playerModel.autoChangePlayer,
          'activePlayer': playerModel.activePlayer.toString(),
          'winnerPlayer': playerModel.winnerPlayer.toString(),
          'tagPlayer1': playerModel.tagPlayer1,
          'tagPlayer2': playerModel.tagPlayer2,
          'gameFinished': playerModel.gameFinished,
          'a1': playerModel.a1,
          'a2': playerModel.a2,
          'a3': playerModel.a3,
          'b1': playerModel.b1,
          'b2': playerModel.b2,
          'b3': playerModel.b3,
          'c1': playerModel.c1,
          'c2': playerModel.c2,
          'c3': playerModel.c3,
          'namePlayer1': playerModel.namePlayer1,
          'colorPlayer1': playerModel.colorPlayer1.toString(),
          'namePlayer2': playerModel.namePlayer2,
          'colorPlayer2': playerModel.colorPlayer2.toString(),
        })
        .then((value) => print("Game Added"))
        .catchError((error) => print("Failed to add game: $error"));
  }

  Future<void> getGame(var gameId) {
    return FirebaseFirestore.instance
        .collection('games')
        .doc(gameId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> updateGame(var gameId, var playerModel) {
    return games
        .doc(gameId)
        .update({
          'autoChangePlayer': playerModel.autoChangePlayer,
          'activePlayer': playerModel.activePlayer,
          'winnerPlayer': playerModel.winnerPlayer,
          'tagPlayer1': playerModel.tagPlayer1,
          'tagPlayer2': playerModel.tagPlayer2,
          'gameFinished': playerModel.gameFinished,
          'a1': playerModel.a1,
          'a2': playerModel.a2,
          'a3': playerModel.a3,
          'b1': playerModel.b1,
          'b2': playerModel.b2,
          'b3': playerModel.b3,
          'c1': playerModel.c1,
          'c2': playerModel.c2,
          'c3': playerModel.c3,
          'namePlayer1': playerModel.namePlayer1,
          'colorPlayer1': playerModel.colorPlayer1,
          'namePlayer2': playerModel.namePlayer2,
          'colorPlayer2': playerModel.colorPlayer2,
        })
        .then((value) => print("Game Updated"))
        .catchError((error) => print("Failed to update game: $error"));
  }
}
