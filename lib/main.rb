# frozen_string_literal: true

require_relative 'game'

# Starts the game and manages flow.
class Main
  def initialize
    @current_game = Game.new
    Display.intro
    choose_mode
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

  def choose_mode
    Display.mode_prompt
    selection = gets.chomp
    case selection
    when '1'
      new_game
    when '2'
      load_game
    else
      Display.invalid_input
      choose_mode
    end
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
end

Main.new
