class RobotSheepDog
  attr_reader :x, :y, :prev_x, :prev_y, :move_counter, :orders, :heading
  def initialize(x, y, heading, orders)
    @x, @y, @heading, @orders = x, y, COMPASS.index(heading), orders
    @move_counter = -1
    @active = true
  end

  def prepare_move(paddock)
    if active?
      if set_dog
        paddock.place_dog(self)
      else
        record_prev_position
        next_instruction
        paddock.plot(self)
      end
      finish if move_counter == orders.count
      @move_counter += 1
    end
  end

  def position
    "#{x} #{y} #{COMPASS[heading]}"
  end

  def active?
    @active == true
  end

  private
    def set_dog
      move_counter == -1
    end

    def finish
      @active = false
    end

    def next_instruction
      case orders[move_counter ]
        when 'L'
          @heading -= 1
          @heading = 4 if heading == -1
        when 'R'
          @heading += 1
          @heading = 1 if heading == 5
        when 'M'
          move_direction
      end
    end

    def move_direction
      case COMPASS[@heading]
        when 'N' then @y += 1
        when 'S' then @y -= 1
        when 'E' then @x += 1
        when 'W' then @x -= 1
      end
    end

    def record_prev_position
      @prev_x, @prev_y= x, y
    end
    COMPASS = ['N', 'E', 'S', 'W']
end
