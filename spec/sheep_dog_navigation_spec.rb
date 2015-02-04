require 'spec_helper'
describe SheepDogNavigation do
  let(:rc) { SheepDogNavigation}
  let(:robot_instructions) {"spec/robot_instructions.txt"}
  let(:paddock) {Paddock.new(5,5)}
  describe '#loadfile' do
    it 'has a filename' do
      rc.loadfile robot_instructions
      expect(rc.filename).to eq robot_instructions
    end
  end
  describe '#start' do
    before(:each) do
      rc.loadfile robot_instructions
      allow(rc).to receive(:paddock).and_return(paddock)     
    end
    it 'calls paddock.activity' do
      allow(rc).to receive(:setup)
      expect_any_instance_of(Paddock).to receive(:activity)
      rc.start
    end
    it 'organises instructional array' do
      rc.send(:setup)
      expect(rc.instruction_array).to eq ['1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM']
    end
  end
  describe '#start with paddock' do
    it 'inserts 2 dogs into the paddock' do
      rc.loadfile robot_instructions
      rc.send(:setup)
      expect(rc.paddock.dogs.count).to eq 2
    end
  end
end