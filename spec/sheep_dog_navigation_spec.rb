require 'spec_helper'
describe SheepDogNavigation do
  let(:rc) { SheepDogNavigation}
  describe '#loadfile' do
    it 'has a filename' do
      rc.loadfile "spec/robot_instructions.txt"
      expect(rc.filename).to eq "spec/robot_instructions.txt"
    end
  end
  describe '#read_instructions' do
    it 'reads the instruction from the file to an array' do
      rc.loadfile "spec/robot_instructions.txt"
      expect(rc.read_instructions).to eq %W(55 12N LMLMLMLMM 33E MMRMMRMRRM)
    end
  end
end