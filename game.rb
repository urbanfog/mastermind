# Game Objective: Guess exact position of the 4 colors

# Rules:
# A color can only be used once in a sequence
# Turn feedback is either: right colour, right position (red dot); right colour, wrong position (white dot); or, nothing 
# Colors are red, green, blue, yellow, brown, orange, black, and white
# Maximum of 12 rounds

# Game flow:
# Computer randomly selects sequence of 4 colors
# Human guesses 4 colors
# Computer provides feedback


# Part 2
# Allow human to set sequence and computer to guess ramdonly

# Part 3
# Make the computer guess smarter

# add color methods to String class for colorizing outputs
class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_yellow;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
end

class Mastermind
  COLORS = %i[black red green yellow blue magenta cyan gray]
  
  def initialize
    @secret_code = Array.new(4, "?")
    @player_choices = Hash.new(1 => [1, 2, 3, 4], 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ",
                               7 => " ", 8 => " ", 9 => " ", 10 => " ", 11 => " ", 12 => " ")
    @round = 1
  end

  def play_game
    puts "Welcome to.... MASTERMIND."
    puts "Try your luck guessing the CPU's impossible combination."
    puts "Generating impossible combination....."
    puts "Done"
    puts "------------------------------------------------------------"
    
    computer_select_code
    while @round <= 12
      show_board
      player_choice
    end

  end

  def computer_select_code
    code = []
    4.times do
      random_number = Random.rand(8)# rand returns less than max
      code << COLORS[random_number] 
    end
    @secret_code = code
  end

  def show_board
    b = 'B'.bg_black
    r = 'R'.bg_red
    g = 'G'.bg_green
    y = 'Y'.bg_yellow
    d = 'D'.bg_blue
    m = 'M'.bg_magenta
    c = 'C'.bg_cyan
    w = 'W'.bg_gray
    
    puts "
    MASTERMIND

         12  11  10   9   8   7   6   5   4   3   2   1
    +---+-----------------------------------------------+-------+
    | ? | #{@player_choices[12][0]} | #{@player_choices[11][0]} | #{@player_choices[10][0]} | #{@player_choices[9][0]} | #{@player_choices[8][0]} | #{@player_choices[7][0]} | #{@player_choices[6][0]} | #{@player_choices[5][0]} | #{@player_choices[4][0]} | #{@player_choices[3][0]} | #{@player_choices[2][0]} | #{@player_choices['test'][0]} | #{b} | #{d} |
    +---+-----------------------------------------------+-------+
    | ? | #{@player_choices[12][1]} | #{@player_choices[11][1]} | #{@player_choices[10][1]} | #{@player_choices[9][1]} | #{@player_choices[8][1]} | #{@player_choices[7][1]} | #{@player_choices[6][1]} | #{@player_choices[5][1]} | #{@player_choices[4][1]} | #{@player_choices[3][1]} | #{@player_choices[2][1]} | #{@player_choices[1][1]} | #{r} | #{m} |
    +---+-----------------------------------------------+-------+
    | ? | #{@player_choices[12][2]} | #{@player_choices[11][2]} | #{@player_choices[10][2]} | #{@player_choices[9][2]} | #{@player_choices[8][2]} | #{@player_choices[7][2]} | #{@player_choices[6][2]} | #{@player_choices[5][2]} | #{@player_choices[4][2]} | #{@player_choices[3][2]} | #{@player_choices[2][2]} | #{@player_choices[1][2]} | #{g} | #{w} |
    +---+-----------------------------------------------+-------+
    | ? | #{@player_choices[12][3]} | #{@player_choices[11][3]} | #{@player_choices[10][3]} | #{@player_choices[9][3]} | #{@player_choices[8][3]} | #{@player_choices[7][3]} | #{@player_choices[6][3]} | #{@player_choices[5][3]} | #{@player_choices[4][3]} | #{@player_choices[3][3]} | #{@player_choices[2][3]} | #{@player_choices[1][3]} | #{y} | #{c} |
    +---+-----------------------------------------------+-------+
         ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___
         ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___

    "
    puts @player_choices['1']
    puts @player_choices[12][1].to_s.length
  end

  def player_choice
    choice = []
    puts "What do you think the code is?"
    puts "Top spot?"
    choice << gets.chomp
    puts "Middle-top spot?"
    choice << gets.chomp
    puts "Middle-bottom spot?"
    choice << gets.chomp
    puts "Bottom spot?"
    choice << gets.chomp
    
    @player_choices[@round] = choice
    @round += 1
  end
end
game = Mastermind.new()
game.play_game