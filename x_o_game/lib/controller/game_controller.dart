import 'package:flutter/foundation.dart';

import '../model/game_model.dart';

class GameController extends ChangeNotifier {
  final GameModel _gameModel = GameModel();

  List<String> get board => _gameModel.board;
  String get currentPlayer => _gameModel.currentPlayer;
  bool get isGameOver => _gameModel.isGameOver;
  String get winner => _gameModel.winner;

  void resetGame() {
    _gameModel.resetGame();
    notifyListeners();
  }

  void makeMove(int index) {
    _gameModel.makeMove(index);
    notifyListeners();
  }
}
