class Paddock
  attr_reader :x, :y
  def initialize(x,y)
    @x, @y = x, y
  end
  def activity
    #keep processing till all robots inactive
    #loop robot.prepare_move(self)
  end
end