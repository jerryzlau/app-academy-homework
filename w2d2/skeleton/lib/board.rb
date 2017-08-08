class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = build_cups
    @name1 = name1
    @name2 = name2
  end

  def build_cups
    cups = Array.new(14) {[]}
    non_store = (0..13).reject {|el| el == 6 || el == 13}
    non_store.each {|idx| cups[idx] = [:stone, :stone, :stone, :stone]}
    cups
  end


  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(1,13)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      case idx
      when 6
        @cups[6] << stones.pop if current_player_name == @name1
      when 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[idx] << stones.pop
      end
    end

    render
    next_turn(idx)
  end



  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|el| el.empty?} || @cups[7..12].all? {|el| el.empty?}
  end

  def winner
    return :draw if @cups[13].count == @cups[6].count
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
