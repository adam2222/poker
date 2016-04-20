require 'rspec'
require 'card'

describe Card do

  subject(:card) { Card.new(:spade, 14) }
  it 'initializes' do
    expect(card).to be_a(Card)
  end

  it 'has a suit' do
    expect(card.suit).to be_a(Symbol)
  end

  it 'has a value' do
    expect(card.value).to be_a(Fixnum)
  end

  it 'has values between 2 and 14' do
    expect(card.value.between?(2, 14)).to be_truthy
  end

end
