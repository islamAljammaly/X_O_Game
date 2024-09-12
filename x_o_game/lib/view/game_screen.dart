import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/game_controller.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('X_O Game '),centerTitle: true,backgroundColor: Colors.blueAccent,),
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBoard(gameController),
          SizedBox(height: 30,),
          if (gameController.isGameOver)
            Text('${gameController.winner} : الفائز', style: TextStyle(fontSize: 24,color: Colors.white)),
          _buildResetButton(gameController),
        ],
      ),
    );
  }

  Widget _buildBoard(GameController gameController) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => gameController.makeMove(index),
          child: Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.white,
            child: Center(
              child: Text(
                gameController.board[index],
                style: TextStyle(fontSize: 36),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResetButton(GameController gameController) {
    return ElevatedButton(
      onPressed: gameController.resetGame,
      child: Text('إعادة اللعبة'),
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(102, 181, 241, 0.416))),
    );
  }
}
