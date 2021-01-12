# frozen_string_literal: true

require 'yaml'
require 'pry'

binding.pry

YAML.load File.read('test.yaml')
a = 20