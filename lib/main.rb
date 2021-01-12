# frozen_string_literal: true

require_relative 'game'

# Starts the game and manages flow.
class Main
  def initialize
    @current_game = Game.new
    choose_mode
  end

  def create_save_list
    @save_list = {}
    saves = Dir.open('saves')
    i = 0
    saves.each do |file|
      if file.include?('yml')
        @save_list[i.to_s] = file
        i += 1
      end
    end
    Display.save_select(@save_list)
  end

  def choose_mode
    Display.mode_prompt
    choice = gets.chomp
    return new_game if choice == '1'
    return load_game if choice == '2'
    return lore if choice == '3'

    Display.invalid_input
    choose_mode
  end

  def load_game
    create_save_list
    selection = gets.chomp
    if @save_list.key?(selection)
      @current_game.load_game(@save_list[selection])
      @current_game.resume_game
    else
      Display.invalid_input
      load_game
    end
  end

  def new_game
    @current_game.start_game
  end

  def lore
    Display.lore
    choose_mode
  end
end

Main.new
