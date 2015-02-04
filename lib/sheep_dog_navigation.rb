module SheepDogNavigation
  class << self
    attr_reader :filename, :instruction_array, :paddock
    def loadfile(filename)
      @filename = filename
      @paddock_area = Paddock
    end

    def start
      setup
      paddock.activity
    end

    private
      def setup
        @instruction_array = read_instructions
        dimentions = @instruction_array.shift
        row, cell = dimentions.split(' ').map(&:to_i)
        @paddock = @paddock_area.new(row, cell)
        robot_instructions.each do | commands |
          x, y, direction, orders = commands
          x, y = x.to_i, y.to_i
          @paddock.add_robot RobotSheepDog.new(x,y, direction, orders.split(//))
        end
      end

      def read_instructions
        array = IO.readlines(filename)
        array.map(&:strip)
      end

      def robot_instructions
        robot_array = instruction_array.each_slice(2).to_a
        robot_array.map{|r| [r[0].split(' '), r[1]].flatten}
      end
  end
end