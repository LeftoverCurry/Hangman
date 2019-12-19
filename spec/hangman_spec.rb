# frozen_string_literal: true

require './hangman.rb'

describe NewGame do
  context 'New User' do
    let(:new_game) do
      NewGame.new('New User', true)
    end

    it 'creates a new user name in the correct format' do
      expect(new_game.user_name).to eq('new_user')
    end

    it 'creates a new game if no user file is found' do
      expect(new_game.game_data.guesses_remaining).to eq(5)
    end

    it 'creates a new save file for the user' do
      expect(File).to exist('saved_games/new_user.json')
    end
  end

  context 'Returning User' do
    let(:returning_user) do
      NewGame.new('tester_info', true)
    end

    it 'pulls user info' do
      expect(returning_user.game_data.guesses_remaining).to eq(2)
    end
  end
  after(:all) do
    if File.exist?('saved_games/new_user.json')
      File.delete('saved_games/new_user.json')
    end
  end
end
