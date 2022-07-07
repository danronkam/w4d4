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

    
end