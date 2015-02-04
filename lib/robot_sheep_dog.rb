class RobotSheepDog
  attr_reader :active, :x, :y, :prev_x, :prev_y, :move_counter, :orders, :heading
  def initialize(x, y, heading, orders)
    @x, @y, @heading, @orders = x, y, COMPASS.index(heading), orders
    @move_counter = -1
    @active = true
  end

  def prepare_move(paddock)
    if active?
      @move_counter += 1
      if move_counter == 0
        paddock.place_dog(self)
      else
        record_prev_position
        next_instruction 
        paddock.plot(self)
      end
      finish if move_counter > orders.count
    end
  end

  def position
    "#{x} #{y} #{COMPASS[heading]}"
  end

  def active?
    active == true
  end

  private
    def finish
      @active = false
    end

    def next_instruction
      case orders[move_counter - 1]
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

