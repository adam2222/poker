class Deck
  attr_reader :cards, :suits, :values

  def initialize
    @suits = [:clubs, :hearts, :diamonds, :spades]
    @values = (1..13).to_a
    @cards = []
  end

  def populate
    suits.each do |suit|
      values.each do |value|
        cards << Card.new(suit, value)
      end
    end
  end

  def shuffle_deck
    @cards.shuffle
  end

  def draw_card
    @cards.pop
  end

end
