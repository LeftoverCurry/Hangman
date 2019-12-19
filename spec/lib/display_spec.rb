# frozen_string_literal: true

require './lib/display.rb'
require './lib/game_data.rb'
require 'json'

describe Display do
  saved_data = JSON.parse(File.read('./saved_games/tester_info.json'))
  let(:game_data) do
    GameData.new(saved_data['user_name'], saved_data['chosen_letters'],
                 saved_data['guesses_remaining'],
                 saved_data['letters_left_to_guess'],
                 saved_data['randomly_picked_word'])
  end
  let(:display) { Display.new(game_data) }

  describe '#show_hangman_image'
  it 'shows the correct image for the hangman' do
    check_file = File.read('./views/two_remaining.txt')
    expect(display.hangman_image(game_data)).to eq(check_file)
  end

  describe '#show_correctly_picked' do
    it 'shows the correctly picked letters' do
      expect(display.show_correctly_picked(game_data)).to eq(' _  a  _  _ ')
    end
  end

  describe '#show_letter_choices' do
    it 'shows incorrectly chosen letters' do
      expect(display.show_letter_choices(game_data)).to eq('USED LETTERS: ["r", "s", "t", "a"]')
    end
  end
end
