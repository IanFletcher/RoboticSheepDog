module RobotController
  class << self
    attr_reader :filename, :instruction_array
    def loadfile(filename)
      @filename = filename
    end

    def start
      setup

    end

    def setup
      @instruction_array = read_instructions
      dimentions = @instructions_array.shift
      paddock = Paddock.new(dimentions.split(' ').map(&:to_i))
      robot_instructions.each do | commands |
        x, y, direction, orders = commands
        RobotSheepDog.new(x,y, direction, orders.to_a)
      end
    end

    def read_instructions
      array = IO.readlines(filename)
      array.map(&:strip)
    end

    def robot_instructions
      robot_array = instructions_array.each_slice(2).to_a
      robot_array.map{|r| [r[0].split(' '), r[1]].flatten}
    end
  end
end