// lib/screens/game_screen.dart
import 'package:flutter/material.dart';

import '../models/game_state.dart';
import '../services/socket_service.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameState gameState = GameState();
  final SocketService socketService = SocketService();

  @override
  void initState() {
    super.initState();
    socketService.connect(); // No argument passed here
    socketService.onMoveReceived((index, player) {
      setState(() {
        gameState.board[index] = player;
        gameState.checkWinner();
      });
    });
  }

  void handleTap(int index) {
    if (gameState.makeMove(index)) {
      socketService.sendMove(index, gameState.currentPlayer);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic-Tac-Toe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleTap(index),
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  color: Colors.blue[200],
                  child: Center(
                    child: Text(
                      gameState.board[index],
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
          if (gameState.gameOver)
            Text(
              gameState.winner == 'Draw'
                  ? 'It\'s a Draw!'
                  : 'Winner: ${gameState.winner}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
