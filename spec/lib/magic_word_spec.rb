# frozen_string_literal: true

require './lib/magic_word.rb'

describe 'Magic Word Class' do
  magic_word = MagicWord.new

  it 'pulls a random word from dictionary file' do
    expect(magic_word.string).to be_instance_of(String)
  end

  it 'returns an array of the chosen word' do
    expect(magic_word.data).to be_instance_of(Array)
  end
end
