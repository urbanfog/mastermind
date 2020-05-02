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
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
end

class Mastermind
  COLORS = %i[red green blue yellow brown orange black white]
  def show_board
    puts "HELLO".bg_red
    puts COLORS
  end
end
game = Mastermind.new()
game.show_board