class RobotSheepDog
  attr_reader :active
  def initialize(x, y, facing, directions)
    @x, @y, @facing @directions = x, y, COMPASS.index(facing), directions
    @move_counter = 0
    @active = true
  end

  def prepare_move
    next_instruction if active?

  end
  def move

  end

  def next_instruction
    #is it facing or moving?
    if 'L'
  end

  def deactivate
    @active = false
  end
  
  def active?
    active == true
  end

  def orientation
    case direction
      when 'L'
        @facing -= 1
        @facing = 4 if facing == -1
      when 'R'
        @facing += 1
        @facing = 1 if facing == 5
      when 'M'
    end
  end
  COMPASS = ['N', 'E','S', 'W']
end