class Board
    # protected
    attr_reader :board, :example
    def initialize
    @board = [  ['','',''],
                ['','',''],
                ['','','']
                            ]
    @example = [[1,2,3],[4,5,6],[7,8,9]]
    @marks = 0
    end

    
    def draw  board
        for i in (0..2)
            board[i].each {|x| print "[#{x}]"}
            puts
        end
        # puts @example.inspect
    end


end



class Game 

def initialize
    @board = Board.new()
    @player1 = ''
    @player2 = ''

end

def play
    puts 'What is the name of the 1st player:'
    @player1 = gets.chomp
    puts 'What is the name of the 2nd player:'
    @player2 = gets.chomp
    puts "Hello, #{@player1} and #{@player2}. Let's play!"
    puts "This is an example of Board. You should choose a number where you want to put a mark"
    @board.draw @board.example

    loop do
    puts "#{@player1}, it is your turn! Select a number from (1..9)"
    x = legit_number
    puts "You picked up #{x}"


    end



end

private
def legit_number
x = gets.chomp.to_i
    while x<1 or x>9
        puts "C'mon! Put a correct number!"
x = gets.chomp.to_i 
end
x
end

end

game = Game.new()
game.play
# board.draw board.example