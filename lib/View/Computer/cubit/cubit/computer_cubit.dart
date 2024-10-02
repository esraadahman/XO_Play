import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'computer_state.dart';

class ComputerCubit extends Cubit<ComputerState> {
  ComputerCubit() : super(ComputerInitial());

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

          startTimer(false);

          emit(ComputerHaveWinner(winner: 'X'));
        } else if (winnerPlayer == 'O') {
          oScore++;

          startTimer(true);

          emit(ComputerHaveWinner(winner: 'O'));
        } else if (winnerPlayer == 'Draw') {
          drawScore++;
          startTimer(false);
          emit(ComputerHaveWinner(winner: 'Draw'));
        } else {
          playComputer();
          winnerPlayer = getWinner();
          if (winnerPlayer == 'O') {
            oScore++;

            startTimer(true);

            emit(ComputerHaveWinner(winner: 'O'));
          } else if (winnerPlayer == 'Draw') {
            drawScore++;
            startTimer(false);
            emit(ComputerHaveWinner(winner: 'Draw'));
          }
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
    emit(ComputerInitial()); // Reset game state
  }

  void ClearList() {
    sq = List.filled(9, ''); // Reset the board
  }

  // Start timer to reset the game after a win or draw
  void startTimer(bool computer) {
    isPlay = false; // Stop further play until reset

    timer = Timer(
      const Duration(seconds: 1),
      () {
        ClearList(); // Clear the board
        isPlay = true; // Allow play again

        emit(ComputerInitial()); // Emit initial state to refresh the UI
      },
    );
    computer ? playComputer() : null;
  }

  void playComputer() {
    // play => X
    // computer => O
    /*
    1- win O
    2- deafeat X
    3- play any way
     */
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    // win O
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'O' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'O' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'O' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // win O

    // defeat X
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && a == 'X' && c == '') {
        sq[winIndex[i][2]] = 'O';
        return;
      }
      if (a == c && a == 'X' && b == '') {
        sq[winIndex[i][1]] = 'O';
        return;
      }
      if (c == b && b == 'X' && a == '') {
        sq[winIndex[i][0]] = 'O';
        return;
      }
    }
    // defeat X

    // paly any way
    List indxes = [0, 1, 2, 3, 4, 5, 7, 8]; // index of sq
    indxes.shuffle(Random()); // choose index in random way
    for (var i = 0; i < sq.length; i++) {
      if (sq[indxes[i]] == "") {
        sq[indxes[i]] = 'O';
        return;
      }
    }
    // paly any way
  }
}
