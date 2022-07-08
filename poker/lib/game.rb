require_relative 'deck.rb'
require_relative 'player.rb'

class Game
    attr_reader :deck, :players, :current_player

    def initialize(player_count)
        @deck = Deck.new
        @pot = 0
        @players = []
        make_players(player_count)
        @current_player = @players.first
    end

    def make_players(num)
        (1..num).each do |i|
            @players << Player.new(i, 10)
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

    def start_round
        @players.each do |player|
            # take ante and deal 5 cards
            player.bank -= 1
            player.hand = deal_hands
            @pot += 1
        end
    end

    def play
        while !game_over?
            self.start_round
            self.any_bets?
            # ask players if they want to replace cards
            # re-deal cards
            # second betting round
            self.any_bets?
            # compare hands of all players
            # deal pot
        end

    end

    def any_bets?
        @players.each do |player|
            unless player.folded 
                # display hand to player for x seconds
                # clear terminal
                print "#{player.id} Place your bet: "
                input = gets.chomp.to_i
                player.bank -= input
                @pot += input
            end
        end
    end

    def game_over?
        @players.one? { |player| player.bank > 0 }
    end

end

a = Game.new(3)
