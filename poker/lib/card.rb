class Card
    attr_reader :suite, :color, :value
    
    def initialize(suite, color, value)
        @suite = suite
        @color = color
        @value = value
    end

end