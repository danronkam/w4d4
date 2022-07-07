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
end