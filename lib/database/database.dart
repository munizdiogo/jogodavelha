import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogodavelha/models/player_model.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference games = FirebaseFirestore.instance.collection('games');

  PlayerModel playerModel = PlayerModel();

  Future createGame({required playerModel}) {
    return games
        .add({
          'autoChangePlayer': playerModel.autoChangePlayer,
          'activePlayer': playerModel.activePlayer.toString().split('.').last,
          'winnerPlayer': playerModel.winnerPlayer.toString().split('.').last,
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
          'dateTime': playerModel.dateTime
        })
        .then((value) => value.id)
        .catchError((error) => error);
  }

  Future getGame(var gameId) {
    return FirebaseFirestore.instance
        .collection('games')
        .doc(gameId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        return null;
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> updateGame(var gameId, var playerModel) {
    return games
        .doc(gameId)
        .update({
          'autoChangePlayer': playerModel.autoChangePlayer,
          'activePlayer': playerModel.activePlayer.toString().split('.').last,
          'winnerPlayer': playerModel.winnerPlayer.toString().split('.').last,
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
        .then((value) => null)
        .catchError((error) => print("Failed to update game: $error"));
  }
}
