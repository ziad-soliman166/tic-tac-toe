// lib/models/game_state.dart
class GameState {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  bool gameOver = false;
  String winner = '';

  void reset() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    gameOver = false;
    winner = '';
  }

  bool makeMove(int index) {
    if (board[index] == '' && !gameOver) {
      board[index] = currentPlayer;
      checkWinner();
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      return true;
    }
    return false;
  }

  void checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] != '' &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]]) {
        winner = board[pattern[0]];
        gameOver = true;
        return;
      }
    }

    if (!board.contains('')) {
      winner = 'Draw';
      gameOver = true;
    }
  }
}
