require_relative '../bowling'

def roll_many(rolls, pins)
  rolls.times do
    subject.roll(pins)
  end
end

def roll_spare
  subject.roll(5)
  subject.roll(5)
end

def roll_strike
  subject.roll(10) 
end

describe Bowling,"score" do
  it "returns 0 when rolling all gutter balls" do
    roll_many(20, 0)
    subject.score.should == 0
  end

  it "returns 20 when rolling all ones" do
    roll_many(20, 1)
    subject.score.should == 20
  end

  it "should handle one spare" do
    roll_spare
    subject.roll(3)
    roll_many(17, 0)
    subject.score.should == 16
  end

  it "should handle one strike" do
    roll_strike 
    subject.roll(3)
    subject.roll(4)
    roll_many(16, 0)
    subject.score.should == 24
  end

  it "should return 300 on a perfect game" do
    roll_many(12, 10)
    subject.score.should == 300
  end
end

