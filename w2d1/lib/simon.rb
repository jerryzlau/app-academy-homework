require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    # debugger
    until @game_over
      take_turn
      if @seq == COLORS[0...@sequence_length-1]
        round_success_message
      else
        @game_over = true
      end
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    COLORS[0...@sequence_length].each {|el| print el + " "}
    puts ""
  end

  def require_sequence
    puts "give your input (red, blue, green, yellow)"
    input = gets.chomp
    @seq = input.split
  end

  def add_random_color
    COLORS << COLORS.sample
  end

  def round_success_message
    puts "Yeah! You got it!"
  end

  def game_over_message
    puts "Boooo you lose!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end

game = Simon.new
game.play
