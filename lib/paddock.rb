class Paddock
  attr_reader :x, :y, :map, :dogs
  def initialize(x,y)
    @x, @y = x, y
    @dogs = []
    @map = Array.new(y + 1) { Array.new(x + 1) {[]} }
  end

  def add_robot(dog)
    @dogs << dog
  end

  def activity
    while any_dogs_active?
      dogs.each do |dg|
        dg.prepare_move(self)
      end
      collisions
    end
    final_positions
  end
  def plot(dog)
    remove_dog(dog)
    place_dog(dog)
  end

  def place_dog(dog)
    sector = map[dog.y][dog.x] if in_paddock(dog)
    sector << dog
    @map[dog.y][dog.x] = sector
  end

  private
    def final_positions
      puts "Dogs Positions"
      puts "--------------"
      dogs.each do |dg|
        dg.position
      end
    end

    def remove_dog(dog)
      sector = @map[dog.prev_y][dog.prev_x]
      sector.delete(dog)
      @map[dog.prev_y][dog.prev_x] = sector
    end


    def collisions
      check_collisions.each do |dg|
        raise RobotSheepDogCollision, "Woof Woof Splat paddock co-ordinates {dg.x} - #{dg.y}"
      end
    end

    def any_dogs_active?  
      active_robots = dogs.map {|dg| dg.active? }
      active_robots.include?(true)
    end

    def check_collisions
      dog_collisions = []
      map.each do |row|
        row.each do |col|
          if col.count > 1
            dog_collisions << col  
            dog_collisions.flatten!
          end
        end
      end
      dog_collisions
    end

    def in_paddock(dog)
      if dog.x >= 0 and dog.x <= x and dog.y >= 0 and dog.y <= y
        true
      else
        raise OutOfPaddock, "Electronic Fido is out of bounds co-ordinates #{dog.x} - #{dog.y}"
      end
    end
end

class RobotSheepDogCollision < StandardError; end
class OutOfPaddock < StandardError; end