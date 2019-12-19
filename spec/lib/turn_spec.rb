# frozen_string_literal: true

require 'rspec'
require './lib/turn.rb'

describe Turn do
  let(:game_data) do
    GameData.pull('tester_info')
  end

  let(:input) do
    'x'
  end

  let(:test_cond) do
    true
  end

  let(:turn) do
    Turn.new(game_data, input, test_cond)
  end

  describe 'Turn#show_display' do
    it 'pulls the correct display' do
      expect(turn.display.show_correctly_picked(game_data)).to eq(' _  a  _  _ ')
    end
  end

  describe 'Turn#action' do
    it 'adds the guessed letter to the list' do
      expect(turn.game_data.chosen_letters).to eq(%w[r s t a x])
    end

    it 'increments the number of missed letters' do
      expect { turn.action('x') }.to change(
        turn.game_data, :guesses_remaining
      ).by(-1)
    end
  end

  describe 'Turn#win_or_lose' do
    it 'determines the game status' do
      expect(turn.win_or_lose).to be true
    end
  end
end
