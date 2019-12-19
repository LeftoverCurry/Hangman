# frozen_string_literal: true

require './lib/game_data.rb'

def fixture
  saved_data = JSON.parse(File.read('./saved_games/tester_info.json'))
  let(:game_data) do
    GameData.new(saved_data['user_name'], saved_data['chosen_letters'],
                 saved_data['guesses_remaining'],
                 saved_data['letters_left_to_guess'],
                 saved_data['randomly_picked_word'])
  end
end

context 'new user' do
  game_data = GameData.new('test_name')

  it 'creates a new game_data object' do
    expect(game_data).to be_instance_of(GameData)
  end

  it 'creates new default info' do
    expect(game_data.user_name).to eq('test_name')
    expect(game_data.chosen_letters).to eq([])
    expect(game_data.guesses_remaining).to eq(5)
  end
end

describe '#save' do
  fixture

  it 'saves a new file' do
    game_data.save
    expect(File).to exist('saved_games/tester.json')
  end

  after(:all) do
    File.delete('saved_games/tester.json')
  end
end

describe 'GameData#pull' do
  game_data = GameData.pull('tester_info')

  it 'pulls user info' do
    expect(game_data.guesses_remaining).to eq(2)
  end
end
