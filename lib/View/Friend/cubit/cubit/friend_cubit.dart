import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'friend_state.dart';

class FriendCubit extends Cubit<FriendState> {
  FriendCubit() : super(FriendInitial());

  List sq = ["", "", "", "", "", "", "", "", ""];
  String frist = "X", winnerPlayer = "";
  int xSocre = 0, oScore = 0, drawScore = 0;
  bool isPlay = true;
  Timer? timer;

  void ClickContainer(int index) {
    if (sq[index] == '' && isPlay) {
      // Check if play is allowed
      if (frist == "X") {
        sq[index] = "X";
        winnerPlayer = getWinner();
        if (winnerPlayer == 'X') {
          xSocre++;
          frist = 'X';
          startTimer();

          emit(FriendHaveWinner(winner: 'X'));
        } else if (winnerPlayer == 'O') {
          oScore++;
          frist = 'O';
          startTimer();

          emit(FriendHaveWinner(winner: 'O'));
        } else if (winnerPlayer == 'Draw') {
          drawScore++;
          startTimer();
          emit(FriendHaveWinner(winner: 'Draw'));
        } else {
          frist = "O";
        }
      } else {
        sq[index] = "O";
        frist = "X";
        winnerPlayer = getWinner();
        if (winnerPlayer == 'O') {
          oScore++;
          frist = 'O';
          startTimer();

          emit(FriendHaveWinner(winner: 'O'));
        } else if (winnerPlayer == 'X') {
          xSocre++;
          frist = 'X';
          startTimer();

          emit(FriendHaveWinner(winner: 'X'));
        } else if (winnerPlayer == 'Draw') {
          drawScore++;
          startTimer();
          emit(FriendHaveWinner(winner: 'Draw'));
        }
      }
    }
  }

  // Check for win condition or draw
  String getWinner() {
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && b == c && a != "") {
        return a;
      }
    }
    if (!sq.contains("")) {
      return "Draw"; // If no more moves are possible
    }
    return ""; // No winner yet
  }

  void ResetFunction() {
    ClearList();
    frist = 'X';
    xSocre = 0;
    oScore = 0;
    drawScore = 0;
    emit(FriendInitial()); // Reset game state
  }

  void ClearList() {
    sq = List.filled(9, ''); // Reset the board
  }

  // Start timer to reset the game after a win or draw
  void startTimer() {
    isPlay = false; // Stop further play until reset

    timer = Timer(
      const Duration(seconds: 1),
      () {
        ClearList(); // Clear the board
        isPlay = true; // Allow play again

        emit(FriendInitial()); // Emit initial state to refresh the UI
      },
    );
  }
}
