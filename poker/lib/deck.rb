class Deck
    attr_reader :deck

    SUITES = [:D, :C, :H, :S]
    COLOR = [:R, :B]
    VALUE = [1,2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]

    def initialize
        @deck = []
    end

    def build_deck
        VALUE.each do |val|
            SUITES.each do |suite|
                COLOR.each do |color|
                    @deck << Card.new(suite, color, val)
    
                end
            end
        end
    end


end