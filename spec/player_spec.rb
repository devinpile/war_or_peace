require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq('Clarisa')
    expect(player.deck).to eq(deck)
  end

  it "can return if a player has lost" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to be(false)
    expect(player.deck.remove_card).to eq(card1)
    expect(player.has_lost?).to be(false)
    expect(player.deck.remove_card).to eq(card2)
    expect(player.has_lost?).to be(false)
    expect(player.deck.remove_card).to eq(card3)
    expect(player.has_lost?).to be(true)
    expect(player.deck).to eq(deck)
  end

end