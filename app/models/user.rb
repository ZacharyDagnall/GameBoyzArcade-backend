class User < ApplicationRecord
    has_many :games

    def find_open_game(name_of_the_game)
        self.games.find{|game| game.name == name_of_the_game && !game.game_over}
    end
end
