require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }
  it 'initializes with an empty stack of cards' do
    expect(deck.cards).to eq([])
  end

  it 'initializes with an array of four suits' do
    expect(deck.suits.length).to eq(4)
  end

  it 'initializes with an array of thirteen values' do
    expect(deck.values.length).to eq(13)
  end

  describe '#populate' do
    it 'creates an array of 52 items' do
      deck.populate
      expect(deck.cards.length).to eq(52)
    end

    it 'makes every item in the deck a card instance' do
      expect(deck.cards.all? { |card| card.is_a?(Card) }).to be_truthy
      deck.populate
    end
  end

  describe '#shuffle_deck' do
    it 'calls shuffle on the cards in the deck' do
      expect(deck.cards).to receive(:shuffle)
      deck.shuffle_deck
    end
  end

  describe '#draw_card' do
    it "calls pop one time on cards" do
      expect(deck.cards).to receive(:pop)
      deck.draw_card
    end

    it 'returns a Card' do
      deck.populate
      expect(deck.draw_card).to be_a(Card)
      deck.draw_card
    end


    it 'reduces size of remaining deck by 1' do
      deck.populate
      deck.draw_card
      expect(deck.cards.length).to eq(51)
    end

  end

end
