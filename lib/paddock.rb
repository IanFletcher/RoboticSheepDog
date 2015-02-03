class Paddock
  attr_reader :x, :y, :map, :dogs
  def initialize(x,y)
    @x, @y = x, y
    @dogs = []
    @map = []
    y.times do |row|
      @map[row] = Array.new(x, [])
    end
  end

  def add_robot(dog)
    @dogs << dog
  end

  def [](col,row)
    map[row][col]
  end

  def []=(col,row,value)
    map[row][col] = value
  end

  def activity
    while dogs_active?
      dogs.each do |dg|
        dg.prepare_move(self)
      end
      collisions
    end
  end
  def plot(dog)
    remove_dog(dog)
    place_dog(dog)
  end

  def remove_dog(dog)
    sector = @map[dog.prev_x, dog.prev_y]
    sector.delete(dog)
  end

  def place_dog(dog)
    sector = @map[dog.x, dog.y] 
    sector << dog
    @map[dog.x, dog.y] = sector
  end

  def erase_dog(dog)
    sector = @map[dog.x, dog.y]
    sector.delete(dog)
  end

  def collisions
    #boundery or other dog
    check_collisions.each do |dg|
      erase_dog(dg)
      dg.deactivate
      place_dog(dg)
    end
  end

  def dogs_active?  
    active_robots = dogs.map {|dg| dg.active? }
    active_robots.include?(true)
  end

  def check_collisions
    dog_collisions = []
    map.each do |row|
      row.each do |col|
        dog_collisions << c  if col.count > 1
      end
    end
    dog_collisions
  end
end