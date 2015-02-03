class RobotSheepDog
  attr_reader :active, :x, :y, :prev_x, :prev_y, :move_counter
  def initialize(x, y, heading, orders)
    @x, @y, @heading @orders = x, y, COMPASS.index(heading), orders
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
    puts "#{x} #{y} #{heading}"
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
        @heading -= 1
        @heading = 4 if heading == -1
      when 'R'
        @heading += 1
        @heading = 1 if heading == 5
      when 'M'
        case COMPASS[@heading]
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