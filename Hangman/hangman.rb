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
turn
end




private

def selectWordFrom file
dict = File.open(file,'r') {|file| file.readlines.select {|word| word.strip.length >=5 and word.strip.length <=12}}
@word = dict[rand(0..dict.size)].strip.upcase
puts @word
@word.length.times {@bank.push '_'}
puts @bank.join(' ')

end


def turn
while true
puts "Word: #{@bank}"
puts "Guesses: #{@guesses}"
puts "Misses: #{@misses}"
break if isGuessed? or gameOver?

puts "select a letter:"

c = gets.strip.upcase
until legitLetter? c
puts 'ERROR!'
puts "select a letter:"
c = gets.strip.upcase
end
puts "You chose - #{c}"
check c
puts '________________________________________________________________________________________'
puts '________________________________________________________________________________________'
puts '________________________________________________________________________________________'

end
puts 'game over'
end



def check c
if @word.include? c
 index = []
 @word.split('').each_with_index {|x,i| index.push i if x==c}
 index.each {|x| @bank[x] = c}   
# index = @word.index c
# @bank[index] = c

else
    if @misses.include? c
        puts 'try again'
    else
        @misses.push c
        @guesses -= 1
    end
        
end
end


def legitLetter? c
return true if c.length == 1 and c.match?(/[a-zA-Z]/)
return false
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