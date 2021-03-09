class User < ApplicationRecord
    has_many :games

    def next_game(name_of_the_game)     # this method finds an existing open game (of the given type), or creates a new one if none exist
        open_game = self.games.find{|game| game.name == name_of_the_game && !game.game_over}
        open_game ? open_game : Game.create(user: self, name: name_of_the_game)
    end

    def scores
        blah = self.games.where(game_over: true)
        blah.map{|game| "game:#{game.name}, score: #{game.score}"}
    end
end

