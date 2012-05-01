class Bowling
  def roll(pins)
    @rolls ||= []
    @rolls << pins 
  end

  def score
    score = 0
    @start_of_frame = 0
    10.times do
      score += next_two_balls if open_frame?
      score += next_three_balls if closed_frame?
      @start_of_frame += strike? ? 1 : 2
    end
    score
  end

  def next_two_balls
    @rolls[@start_of_frame] + @rolls[@start_of_frame+1]
  end

  def open_frame?
    next_two_balls < 10
  end

  def next_three_balls
    next_two_balls + @rolls[@start_of_frame+2]
  end

  def closed_frame?
    !open_frame?
  end

  def strike?
    @rolls[@start_of_frame] == 10
  end
end
