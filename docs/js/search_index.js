var search_data = {"index":{"searchIndex":["board","connect4","display","player","add_chip()","add_player()","after()","ask_yn()","board()","clear()","full?()","game_input()","game_input()","gameover?()","get_data()","invalid_input()","length()","new()","new()","new()","new()","play()","play_round()","player_add()","prompt_game_input()","prompt_player_add()","prompt_yn()","reply_yn()","rules()","show_after()","show_board()","show_rules()","valid_move?()","winner?()","readme"],"longSearchIndex":["board","connect4","display","player","board#add_chip()","connect4#add_player()","display#after()","display#ask_yn()","display#board()","display#clear()","board#full?()","display#game_input()","player#game_input()","board#gameover?()","board#get_data()","display#invalid_input()","board#length()","board::new()","connect4::new()","display::new()","player::new()","connect4#play()","connect4#play_round()","display#player_add()","connect4#prompt_game_input()","connect4#prompt_player_add()","connect4#prompt_yn()","player#reply_yn()","display#rules()","connect4#show_after()","connect4#show_board()","connect4#show_rules()","board#valid_move?()","board#winner?()",""],"info":[["Board","","Board.html","","<p>This class is the main logic for all board functions.\n"],["Connect4","","Connect4.html","","<p>Main class that ties all the pieces together.\n"],["Display","","Display.html","","<p>This class handles the display for the game.\n"],["Player","","Player.html","","<p>Class that primarily handles input and data for players.\n"],["add_chip","Board","Board.html#method-i-add_chip","(col, value)","<p>Adds a token to the board.\n<p><code>col</code> is the column\n<p><code>value</code> is the value to add.\n"],["add_player","Connect4","Connect4.html#method-i-add_player","(player)","<p>Helper method to update +@players+ instance variable with <code>player</code>\n"],["after","Display","Display.html#method-i-after","(moves, players)","<p>Shows the after-game messaging.\n<p><code>moves</code> are the number of moves in the game.\n<p><code>players</code> are the current players …\n"],["ask_yn","Display","Display.html#method-i-ask_yn","(prompt)","<p>Prompts for y/n based on the <code>prompt</code> provided.\n"],["board","Display","Display.html#method-i-board","(board)","<p>Takes <code>board</code> and renders it in console.\n"],["clear","Display","Display.html#method-i-clear","()","<p>Command method to clear current console display.\n"],["full?","Board","Board.html#method-i-full-3F","()","<p>Full? predicate returns true if the board is full.\n"],["game_input","Display","Display.html#method-i-game_input","(player, board)","<p>Primary game input method. Displays the board and then prompts the right player for input.\n"],["game_input","Player","Player.html#method-i-game_input","()","<p>Method to get game input.\n"],["gameover?","Board","Board.html#method-i-gameover-3F","()","<p>Gameover? predicate returns true if there is a winner or the board is full.\n"],["get_data","Board","Board.html#method-i-get_data","()","<p>Helper method to get data representation of board.\n"],["invalid_input","Display","Display.html#method-i-invalid_input","()","<p>Invalid input message.\n"],["length","Board","Board.html#method-i-length","()","<p>Helper method to return length of the game board.\n"],["new","Board","Board.html#method-c-new","()","<p>Creates the data representation and last move.\n"],["new","Connect4","Connect4.html#method-c-new","(display: Display.new)","<p>Initalizes the game with a display\n"],["new","Display","Display.html#method-c-new","()","<p>Initialize method\n"],["new","Player","Player.html#method-c-new","(name, token = nil)","<p>Init with <code>name</code> and <code>token</code>\n"],["play","Connect4","Connect4.html#method-i-play","()","<p>Main gameloop method\n"],["play_round","Connect4","Connect4.html#method-i-play_round","()","<p>Method to play one single peice\n"],["player_add","Display","Display.html#method-i-player_add","(tokens_left)","<p>Prompt to add a name for a player.\n"],["prompt_game_input","Connect4","Connect4.html#method-i-prompt_game_input","()","<p>Method to get game input.\n"],["prompt_player_add","Connect4","Connect4.html#method-i-prompt_player_add","()","<p>Prompts to add players\n"],["prompt_yn","Connect4","Connect4.html#method-i-prompt_yn","()","<p>Method to repeat game?\n"],["reply_yn","Player","Player.html#method-i-reply_yn","()","<p>Method to get reponse.\n"],["rules","Display","Display.html#method-i-rules","()","<p>Displays the current rules of the game.\n"],["show_after","Connect4","Connect4.html#method-i-show_after","()","<p>After round messages\n"],["show_board","Connect4","Connect4.html#method-i-show_board","()","<p>Method to show the board\n"],["show_rules","Connect4","Connect4.html#method-i-show_rules","()","<p>Method to show the rules.\n"],["valid_move?","Board","Board.html#method-i-valid_move-3F","(col)","<p>Checks the input <code>col</code> (an Integer) is within range and that the column isn&#39;t full.\n"],["winner?","Board","Board.html#method-i-winner-3F","()","<p>Winner? predicate returns true if there is a winning combination.\n"],["README","","README_md.html","","<p>ruby_connect4\n<p>TDD exercise to create a CLI Connect 4 from The Odin Project&#39;s Ruby track.\n"]]}}