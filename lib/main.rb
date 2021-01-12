# frozen_string_literal: true

# Starts the game and manages flow.
class Main
  def initialize
    @current_game = Game.new
    # Display.intro
    # select new or load game
  end

  def create_save_list
    @save_list = {}
    saves = Dir.open('saves')
    i = 0
    saves.each do |file|
      if file.include?('yml')
        @save_list[i] = file
        i += 1
      end
    end
    Display.save_select(@save_list)
  end

  def load_game
    create_save_list
    # get player selection
    # make sure number is in list
    current_game.load_game(selected_file)
    current_game.resume_game
  end

  def new_game
    current_game.start_game
  end
end

Main.new
