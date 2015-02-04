require 'spec_helper'
describe Paddock do
  let(:fido) { RobotSheepDog.new(1,1, 'N', ['M']) }
  let(:fluffy) { RobotSheepDog.new(1,3, 'S', ['M']) }
  let(:paddock) { Paddock.new(5,5) }

  describe '#initialize' do 
    it 'has x and y dimentions' do
      expect(paddock.x).to eq 5
      expect(paddock.y).to eq 5
    end
  end
  describe '#add_robot' do
    it 'adds a robot sheepdog' do
      expect{paddock.add_robot(fido)}.to change{paddock.dogs.count}.from(0).to(1)
    end
  end
  describe '#activity' do
    describe 'moves robot sheep dogs' do
      it 'according to instructions' do
        allow(paddock).to receive(:final_positions).and_return(nil)
        paddock.add_robot(fido)
        paddock.activity
        expect(paddock.map[2][1][0]).to eq fido
      end
      it 'monitors for collisions' do
        allow(paddock).to receive(:final_positions).and_return(nil)
        paddock.add_robot(fido)
        paddock.add_robot(fluffy)
        expect{paddock.activity}.to raise_error(RobotSheepDogCollision)
      end
      it 'responds to final positions' do
        expect(paddock).to receive(:final_positions)
        paddock.add_robot(fido)
        paddock.activity
      end
    end
  end
  describe '#place_dog' do
    it 'dog on the map' do
      oldyella = double("RobotSheepDog", x: 2, y: 2, heading: 'N', prev_x: 2, prev_y: 1)
      paddock.place_dog(oldyella)
      expect(paddock.map[2][2][0]).to eq oldyella
    end
    it 'should raise an OutOfPaddock error if outside of paddock' do
      oldyella = double("RobotSheepDog", x: 9, y: 9, heading: 'N')
      expect{paddock.place_dog(oldyella)}.to raise_error(OutOfPaddock)
    end
  end
  describe '#plot' do
    it 'moves the dog on the map' do
      oldyella = double("RobotSheepDog", x: 2, y: 2, heading: 'N', prev_x: 2, prev_y: 1)
      paddock.plot(oldyella)
      expect(paddock.map[2][2][0]).to eq oldyella
    end
  end
end