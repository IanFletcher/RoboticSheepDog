require 'spec_helper'
describe RobotSheepDog do
  let(:instructions) { ['M','R']}
  let(:fido) { RobotSheepDog.new(1,1, 'N', instructions) }
  let(:paddock) { double("Paddock", place_dog: nil, plot: nil) }
  describe '#initialize' do
    it 'with variables' do
      expect(fido.x).to eq 1
      expect(fido.y).to eq 1
      expect(fido.heading).to eq 0
      expect(fido.orders).to eq instructions
    end
  end
  describe "#position" do
    it 'displays position' do
      expect(fido.position).to eq "1 1 N"
    end
  end
  describe '#prepare_move' do
    describe 'processing the moving dogs' do
      it 'increments the move counter' do
        expect{fido.prepare_move(paddock)}.to change{fido.move_counter}.by(1)
      end
      it 'changes the previous co-ordinates when moving' do
        expect{2.times{fido.prepare_move(paddock)}}.to change{fido.prev_y}.from(nil).to(1)
      end
      it 'changes the heading when changing direction' do
        expect{3.times {fido.prepare_move(paddock)}}.to change{fido.heading}.from(0).to(1)
      end
      it 'when finished instructions deactivates' do
        expect(fido).to receive(:finish)
        4.times {fido.prepare_move(paddock)}
      end
    end
  end
  describe '#active?' do
    it 'when it has more instructions to follow' do
      expect(fido.active?).to eq true
    end
    it 'is false when there is no more instructions' do
      expect{4.times {fido.prepare_move(paddock)}}.to change{fido.active?}.from(true).to(false)
    end
  end
end