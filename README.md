TicTacToe-Terminal
=========

This is a simple terminal-based implementation of Tic Tac Toe.

To play, open up a terminal, navigate to the directory in which this repo lives, and execute "ruby TicTacToe.rb".  (It is necessary to have Ruby installed.)

Moves should be input in a "row, column" format (for example, "0, 1" will select the top middle space).

By default, this will begin a game with one human and one computer player.  To change this, open the TicTacToe.rb file and, inside the "if __FILE__ == $PROGRAM_NAME" section, create a second human player instead, using the same syntax as the default human player (hp = HumanPlayer.new("Ned")), and pass the generated player to the TicTacToe.new arguments.

Alternatively, if you wish, you may set the computer to play against itself indefinitely by instead running "ruby wargames.rb".  You will have to manually kill the script (ctrl+C, etc.) to exit this loop; remember, the only winning move is not to play.