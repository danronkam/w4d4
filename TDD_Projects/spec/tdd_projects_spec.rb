require 'rspec'
require 'tdd_projects.rb'

describe Array do
    describe '#uniq' do
        array = [1,2,1,3,3]
        it 'removes duplicates from an array' do
            expect(array.uniq).to eq([1,2,3])
        end
        it 'returns unique elements in the order in which they first appeared' do
            expect(array.uniq).to eq([1,2,3])
        end
    end 

    describe '#two_sum' do
        array = [-1, 0, 2, -2, 1]
        it 'finds all pairs of positions where the elements sum to zero' do
            expect(array.two_sum).to eq([[0,4], [2, 3]])
        end
        it 'sorts by smaller index before bigger index' do
            expect(array.two_sum).to eq([[0,4], [2, 3]])
        end
        it 'should sort pairs by smaller elements' do
            expect(array.two_sum).to eq([[0,4], [2, 3]])
        end
    end

    describe '#my_transpose' do 
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]

        it 'convert between the row-orientated and colum-oriented represenations' do
            expect(rows.my_transpose).to eq([
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
              ])
        end
    end

    describe '#stock_picker' do 
        array = [14, 17, 31, 25, 18, 15, 19]

        it 'returns the most profitable pair of days to buy then sell stock' do
            expect(array.stock_picker).to  eq([0,2])


        end


    end 
end

describe Towers_of_Hanoi do
    subject(:towers) {Towers_of_Hanoi.new(3)}
    describe '#initialize' do
        it 'should receive a size' do 
            expect(towers.size).to be(3)
        end

        it 'should create a board' do
            board = Array.new(3) { Array.new }
            board[0] = [1,2,3]
            expect(towers.board).to eq(board)
        end

        it 'should populate the board' do 
            expect(towers.board[0]).to eq([1,2,3])
        end
    end

    describe 'get_move' do 
        it 'should get an input' do 
            input = double("0 1\n", :chomp=>"0 1")
            allow(towers).to receive(:gets).and_return(input)

            expect(input).to receive(:chomp)
            expect(towers).to receive(:gets)
            towers.get_move
        end
    end

end