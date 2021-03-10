class Game < ApplicationRecord
  belongs_to :user
  
  def initialize(attributes=nil)
    if attributes[:name] == "6144" 
      attr_with_defaults = {board_state: [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]], game_over: false, score: 0}.merge(attributes)
      super(attr_with_defaults)

    else attributes[:name] == "TicTacToe" 
      attr_with_defaults = {board_state: [[0,0,0],[0,0,0],[0,0,0]], game_over: false, score: 0}.merge(attributes)
    super(attr_with_defaults)

  # else attributes[:name] == "TicTacToe" 
  #   attr_with_defaults = {board_state: [[0,0,0],[0,0,0],[0,0,0]], game_over: false, score: 0}.merge(attributes)
  # super(attr_with_defaults)
    end
  end

end
