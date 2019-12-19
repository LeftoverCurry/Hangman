# frozen_string_literal: true

require './lib/game_data.rb'
require './lib/turn.rb'

# Pulls user info and either starts a new game or pulls a saved one
class NewGame
  attr_accessor :user_name
  attr_accessor :game_data

  def initialize(test_var = '', test_cond = false)
    @test_var = test_var
    @test_cond = test_cond
    @user_name = intro(@test_var, @test_cond)
    @game_data = instantiate_game_data(user_name)
    start_game(game_data, test_cond)
  end

  def intro(test_var, test_cond)
    puts File.read('./views/intro')
    puts 'Welcome to Hangman!  May I have your name, please?'
    input = if test_cond == true
              test_var
            else
              collect_user_input
            end

    input.chomp.downcase.gsub(' ', '_')
  end

  def instantiate_game_data(user_name)
    if File.exist?("./saved_games/#{user_name}.json")
      puts 'Welcome Back!'
      GameData.pull(user_name)
    else
      data = GameData.new(user_name)
      data.save
      data
    end
  end

  def collect_user_input
    $stdin.gets
  end

  def start_game(game_data, test_cond)
    return if test_cond == true

    Turn.new(game_data)
  end
end

NewGame.new
