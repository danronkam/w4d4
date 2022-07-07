require_relative 'card.rb'


class Deck
    attr_reader :deck

    SUITS = [:D, :C, :H, :S]
    COLOR = [:R, :B]
    VALUE = [1,2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]

    def initialize
        @deck = []
        self.build_deck(:R)
        self.build_deck(:B)
        deck.shuffle
    end

    def build_deck(color)
        VALUE.each do |val|
            SUITS.each do |suit|
                if (suit == :D && color == :R ) || (suit == :H && color == :R )
                    @deck << Card.new(suit, color, val)
                elsif (suit == :C && color == :B ) || (suit == :S && color == :B )
                    @deck << Card.new(suit, color, val)
                end
            end
        end
    end


end