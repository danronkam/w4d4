require "byebug"
class Array

    def uniq
        unique = [] 
        self.each do |ele|
            unique << ele if !unique.include?(ele)
        end
        unique
    end

    def two_sum
        target = 0
        pairs = []

        self.each_with_index do |ele, i|
            (i+1...self.length).each do |j|
                sum = ele + self[j]
                if sum == target
                    pairs << [i, j].sort unless pairs.include?([i,j].sort)
                end
            end
        end
        pairs
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self.length)}

        self.each_with_index do |subArr, i|
            subArr.each_with_index do |ele, j|
                new_arr[j][i] = ele
            end
        end
           
        new_arr
    end

    def stock_picker
        pair = []
        biggest_profit = nil

        self.each_with_index do |ele, i|
            buy_price = ele

            self.each_with_index do |ele2, j|
                price_change = ele2 - ele

                if biggest_profit == nil || price_change > biggest_profit
                    biggest_profit = price_change
                    pair = [i,j]
                end
            end
        end
        pair
    end

end

class Towers_of_Hanoi
    attr_reader :size, :board

    def initialize
        print "Enter the number of disks: "
        disks = gets.chomp.to_i
        @size = disks
        @board = Array.new(3) { Array.new }
        self.populate
    end

    def populate
        # disk 1 is the top
        @board[0] = (1..@size).to_a
    end

    def get_move
        # print "Enter a starting tower: "
        # start_pile = gets.chomp.to_i
        # print "Enter an ending tower: "
        # end_pile = gets.chomp.to_i
        # [start_pile, end_pile] 
        print "enter a starting and ending tower: "
        gets.chomp.split.map(&:to_i)
    end

    def won?
        @board.last == (1..@size).to_a
    end

    def valid_move?(pos)
        start_pile, end_pile = pos
        # compare the top disks of each pile
        # first check if the ending pile is empty 
        # if start_pile's disk > end_pile's disk, then return false
        return true if @board[end_pile].first.nil? 
        @board[start_pile].first < @board[end_pile].first
    end

    # to move a disk from one tower to another
    # shift first disk from start pile, unshift to the end pile
    def move(pos)
        start_pile, end_pile = pos
        @board[end_pile].unshift(@board[start_pile].shift)
    end

    def render
        @board.each_with_index do |subArr, i|
            print "Top of Tower #{i}: "
            puts subArr.join(" ")
        end
    end

    def play
        while !self.won?
            self.render
            input = self.get_move
            while !self.valid_move?(input)
                puts "Invalid Move"
                input = self.get_move
            end
            move(input)
        end
        puts "You win"
    end

end

game = Towers_of_Hanoi.new
game.play