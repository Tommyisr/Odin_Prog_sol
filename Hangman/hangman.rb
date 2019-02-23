class Game

def initialize file
@guesses = 6
@word = ''
@bank = []
@misses = [] 
@file = file
end

def play 
selectWordFrom @file

end




private

def selectWordFrom file
dict = File.open(file,'r') {|file| file.readlines.select {|word| word.strip.length >=5 and word.strip.length <=12}}
@word = dict[rand(0..dict.size)].strip.upcase
puts @word
@word.length.times {@bank.push '_'}
puts @bank.join(' ')

end

def isGuessed?
return true unless @bank.include?('_')
false
end

def gameOver?
return true if @guesses == 0
false
end

end




game = Game.new 'dictionary.txt'
game.play