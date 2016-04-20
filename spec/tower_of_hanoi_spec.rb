require 'rspec'
require 'tower_of_hanoi'
require 'byebug'


describe TowerGame do

  subject(:tower) { TowerGame.new }

  it "initializes" do
    expect(tower).to be_a(TowerGame)
  end

  it "initializes with an 3 length, two dimensional array with stack in idx 0" do
    expect(tower.board).to eq([[3,2,1],[],[]])
  end

  describe '#move_disc' do

    it 'will not allow you to act on an empty stack' do
      expect { tower.move_disc(2,0) }.to raise_error(RuntimeError)
    end

    it 'moves the disc at the top of the specified stack to the given position' do
      tower.move_disc(0,1)
      expect(tower.board).to eq([[3,2],[1],[]])
    end

    it 'does not allow you to move a larger disc onto a smaller disc' do
      tower.move_disc(0,1) #=> [[3,2],[1],[]]
      tower.move_disc(0,2) #=> [[3],[1],[2]]
      expect { tower.move_disc(2,1) }.to raise_error(RuntimeError)
    end
  end

  describe '#run' do
    it "prompts the user for input" do
      expect(tower).to receive(:gets).at_least(2).times
    end


    it 'calls #move' do
      expect(tower.run).to receive(:move_disc)
    end

    it  '' do

    end
  end

  describe '#won?' do

  end

end
