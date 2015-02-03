class RobotSheepDog
  attr_reader :active, :x, :y, :prev_x, :prev_y, :move_counter
  def initialize(x, y, facing, orders)
    @x, @y, @facing @orders = x, y, COMPASS.index(facing), orders
    @move_counter = 0
    @active = true
  end

  def prepare_move(paddock)
    if active?
      move_counter += 1
      if movecounter == 1
        paddock.place_dog(self)
      else
        record_prev_position
        next_instruction 
        paddock.plot(self)
      end
      finish if move_counters > move_counter
    end
  end

  def position
    puts "#{x} #{y} #{facing}"
  end

  def deactivate
    if @prev_x != x and @prev_y != y
    @x = prev_x
    @y = prev_y
    finish
  end

  def finish
    @active = false
  end

  def active?
    active == true
  end

  def next_instruction
    case direction
      when 'L'
        @facing -= 1
        @facing = 4 if facing == -1
      when 'R'
        @facing += 1
        @facing = 1 if facing == 5
      when 'M'
        case COMPASS[@facing]
          when 'N' then @y += 1
          when 'S' then @y -= 1
          when 'E' then @x += 1
          when 'W' then @x -= 1
        end
    end
  end

  def record_prev_position
    @prev_x, @prev_y= x, y
  end
  COMPASS = ['N', 'E','S', 'W']
end