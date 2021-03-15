class Game < ApplicationRecord
  belongs_to :user

  @rules = {"6144"=> "This game is 2048 but using an additive three instead of two. Use your arrow keys to move all the tiles on the board. Combine matching numbers to add them together, but be careful, when you make a move a new 3 or 6 will appear on the board. The game is over when you have no available moves. See if you can reach the 6144 tile.", "TicTacToe"=>"A classic game of Tic Tac Toe! Click on a space on the board to place your tile \"❌\". The computer will then place it\'s tile \"⭕\". See if you can outsmart the computer!", "LightsOut"=>"An enLIGHTening puzzle game. Click on a tile on the board to turn it and its nieghbors on and off. Watch out though, every click costs you 25 points; you'll game over if you run out of points! Can you light up the whole board in time? ", "FibonacciTiles"=>"Up for a challenge? Try Fibonacci Tiles, a new twist on 6144. Use your arrow keys to move all the tiles on the board. Two tiles will only combine when they add up to a Fibinacci number. Can you reach 6765?", "6144BugMode"=>"Uh-oh! This version of 6144 wasnt ment to be pushed yet, its riddled with bugs!! Maybe you can help us de-bug it? The game plays like 6144: use your arrow keys to move all the tiles on the board and combine matching numbers to add them together. See if you can figure out how to squash those bugs! ", "Connect4"=>"Connect 4 now arrives to Game Boyz Arcade! Click anywhere on the board to drop a token in a slot. The computer will then drop it's token. Win by having four tokens line up vertically, horizontally, or diagonally."}
  
  def initialize(attributes=nil)
    if attributes[:name] == "6144" 
      attr_with_defaults = {board_state: [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], game_over: false, score: 0}.merge(attributes)
      super(attr_with_defaults)

    elsif attributes[:name] == "TicTacToe" 
      attr_with_defaults = {board_state: [[0,0,0],[0,0,0],[0,0,0]], game_over: false, score: 100}.merge(attributes)
      super(attr_with_defaults)

    elsif attributes[:name] == "LightsOut" 
      attr_with_defaults = {board_state: [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]], game_over: false, score: 1000}.merge(attributes)
      super(attr_with_defaults)

    elsif attributes[:name] == "FibonacciTiles"
      attr_with_defaults = {board_state: [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], game_over: false, score: 0}.merge(attributes)
      super(attr_with_defaults)

    elsif attributes[:name] == "6144BugMode"
      attr_with_defaults = {board_state: [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], game_over: false, score: 42}.merge(attributes)
      super(attr_with_defaults)

    elsif attributes[:name] == "Connect4"
      attr_with_defaults = {board_state: [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], game_over: false, score: 500}.merge(attributes)
      super(attr_with_defaults)

    end
    
  end

  def self.leaderboard(name_input)
    Game.all.where(name: name_input, game_over: true).max_by(10){|game| game.score}.map{|game| "#{game.user.name}: #{game.score}"}
  end

  def self.rules(name_input)
    @rules[name_input]
  end

end
