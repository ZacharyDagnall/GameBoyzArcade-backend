class Game < ApplicationRecord
  belongs_to :user

  @rules = {"6144"=> "Swipe (using arrow keys) Up, Down, Left, and Right to combine tiles of the same value. Work for the high score!", "TicTacToe"=>"Click on a tile to place your X. Try to get three in a row!", "LightsOut"=>"When you click on a light box, it will switch on or off, and so will all of the adjacent lights. The goal is to get all the lights on!", "FibonacciTiles"=>"Swipe (using arrow keys) Up, Down, Left, and Right to combine tiles. You can only combine tiles which are adjacent Fibonacci numbers! Work for the high score!", "6144BugMode"=>"This is a Hard Mode of 6144... do your best! If you get stuck, try your best debugging strategies ;)", "Connect4"=>"Click any tile to drop your token into that column. Your opponent will follow and do the same. Try to get four in a row!"}
  
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
