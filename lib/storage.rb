# frozen_string_literal: true

def returning_user?
  if File.exist?("./saved_games/#{@user_name}.json")
    true
  else
    false
  end
end

# Needs to be moved to wrapper
def create_new_instance
  @game_data = if returning_user? == false
                 GameData.new(@user_name)
               else
                 pull_saved
               end
end
