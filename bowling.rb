class Bowling
  def initialize
    @rolls = []
    @roll_ptr = 0
  end

  def roll(pins)
    @rolls << pins 
  end

  def score
    score = 0
    for_each_frame do
      score += next_two_balls if open_frame?
      score += next_three_balls if closed_frame?
      move_to_start_of_next_frame!
    end
    score
  end

  def for_each_frame(&block)
    10.times(&block)
  end
    
  def next_two_balls
    pins_at(@roll_ptr) + pins_at(@roll_ptr+1)
  end

  def open_frame?
    next_two_balls < 10
  end

  def next_three_balls
    next_two_balls + pins_at(@roll_ptr+2)
  end

  def closed_frame?
    !open_frame?
  end

  def pins_at(index)
    return 0 if index >= @rolls.size
    @rolls[index]
  end

  def move_to_start_of_next_frame!
      @roll_ptr += strike? ? 1 : 2
  end

  def strike?
    pins_at(@roll_ptr) == 10
  end
end
