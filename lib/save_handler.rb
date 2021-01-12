# frozen_string_literal: true

require 'yaml'
require 'date'

# handles serializing and unserializing data
module SaveSystem
  def save_game
    puts 'Enter a name for save file'
    name = gets.chomp
    file_name = "#{name}-#{DateTime.now}.yml"
    save_variables = {}
    instance_variables.map do |var|
      save_variables[var] = instance_variable_get(var)
    end
    Dir.mkdir('saves') unless File.exist? 'saves'
    File.open("saves/#{file_name}", 'w') { |save| save.print(YAML.dump(save_variables)) }
    Display.save_success(file_name)
  end

  def load_game(file)
    loaded_variables = YAML.load(File.open("saves/#{file}", 'r').read)
    loaded_variables.each do |key, value|
      instance_variable_set(key, value)
    end
  end
end
