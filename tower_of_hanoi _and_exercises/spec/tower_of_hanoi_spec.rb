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

  describe '#prompt' do

    it 'asks the user for 2 positions' do
      allow(tower).to receive(:gets).and_return("2")
      expect(tower).to receive(:puts).twice
      tower.prompt
    end

    it 'gets input for 1st and 2nd positions' do
      allow(tower).to receive(:gets).and_return("2")
      expect(tower).to receive(:gets).twice
      tower.prompt
    end

    it 'returns an array of 2 fixnums' do
      allow(tower).to receive(:gets).and_return("2")
      expect(tower.prompt[0]).to be_a(Fixnum)
      expect(tower.prompt[1]).to be_a(Fixnum)
      tower.prompt
    end


  end

  describe '#won?' do

    it 'returns true if board is in win condition' do
      tower.move_disc(0,2)
      tower.move_disc(0,1)
      tower.move_disc(2,1)
      tower.move_disc(0,2)
      tower.move_disc(1,0)
      tower.move_disc(1,2)
      tower.move_disc(0,2)
      expect(tower.won?).to be_truthy
      tower.won?
    end

    it 'returns false if board is not in win condition' do
      expect(tower.won?).to be_falsey
      tower.won?
    end

  end

end
