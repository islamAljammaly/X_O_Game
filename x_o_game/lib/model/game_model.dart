class GameModel {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';
  bool _isGameOver = false;
  String _winner = '';

  List<String> get board => _board;
  String get currentPlayer => _currentPlayer;
  bool get isGameOver => _isGameOver;
  String get winner => _winner;

  void resetGame() {
    _board = List.filled(9, '');
    _currentPlayer = 'X';
    _isGameOver = false;
    _winner = '';
  }

  void makeMove(int index) {
    if (_board[index] == '' && !_isGameOver) {
      _board[index] = _currentPlayer;
      if (_checkWinner()) {
        _isGameOver = true;
        _winner = _currentPlayer;
      } else if (!_board.contains('')) {
        _isGameOver = true;
        _winner = 'Draw';
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }

  bool _checkWinner() {
    List<List<int>> winningPositions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6],            // Diagonals
    ];

    for (var pos in winningPositions) {
      if (_board[pos[0]] != '' && _board[pos[0]] == _board[pos[1]] && _board[pos[1]] == _board[pos[2]]) {
        return true;
      }
    }
    return false;
  }
}
