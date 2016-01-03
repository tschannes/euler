require './Timer.rb'
#require 'pry'

class ColatzMaker

    include Timer

    def initialize(limit)
        @limit = limit
        keys = [:length,:num]
        @greatestSeq = Hash[keys.zip([0,0])]
        #returns {:length=>0,:num=>0}
        super
    end

    def makeSequence(num)
        seqObj = {}
        seqObj[:num] = num
        seq = []
        while num != 1
            seq.push(num)
            if num % 2 == 0
                num = num / 2
            else
                num = num * 3 + 1
            end
        end
        
        seqObj[:length] = seq.length
        return seqObj
    end

    def findLongestChain
        num = 1
        while num < @limit
            #binding.pry
            len = makeSequence(num)
            @greatestSeq = len if len[:length] > @greatestSeq[:length]
            puts @greatestSeq
            num += 1
        end
        puts "The number with the greatest Collatz-Sequence (" + @greatestSeq[:length].to_s + " elements) below " + @limit.to_s + " is " + @greatestSeq[:num].to_s
        return @greatestSeq
    end

    def run
        findLongestChain
        measure
    end

end

x = ColatzMaker.new(100)
x.run