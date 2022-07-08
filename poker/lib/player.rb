

class Player
    attr_reader :id
    attr_accessor :hand, :bank, :folded

    def initialize(number, bank)
        @id = 'Player' + number.to_s
        @hand = []
        @bank = bank
        @folded = false
    end


end