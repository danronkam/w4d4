require_relative 'deck.rb'
require_relative 'player.rb'

class Game
    attr_reader :deck, :players, :current_player

    def initialize(player_count)
        @deck = Deck.new
        @players = []
        make_players(player_count)
        @current_player = @players.first
    end

    def make_players(num)
        (1..num).each do |i|
            @players << Player.new(i, deal_hands)
        end
    end

    def deal_hands
        hand = []
        i = 0

        while hand.length < 5
            hand << @deck.deck.pop
        end
        hand
    end

end