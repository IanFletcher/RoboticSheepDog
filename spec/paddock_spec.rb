require 'spec_helper'
describe Paddock do
  describe '#initialize' do 
    it 'has x and y dimentions' do
      paddock = Paddock.new(5,5)
      expect(paddock.x).to eq 5
      expect(paddock.y).to eq 5
    end
  end
end