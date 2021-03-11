class Game < ApplicationRecord
  belongs_to :user
  
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

end
