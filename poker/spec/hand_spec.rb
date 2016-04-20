require 'rspec'
require 'hand'


let (:card1) { double("value" => 2, "suit" => :heart }
let (:card2) { double("value" => 2, "suit" => :heart }

describe Hand do
  subject(:hand) { Hand.new(cards)}
  describe '#initialize' do
    # it 'has ranked array of hands' do
    #
    # end

    it  'has 5 cards in hand' do
      expect(hand.cards).to be_a(Array)
    end

  end




end
