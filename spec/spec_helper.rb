require 'rubygems'
require 'bundler/setup'
require 'simplecov'
SimpleCov.start
Bundler.require

require_relative '../app/mission'
require_relative '../app/parser'
require_relative '../app/plateau'
require_relative '../app/rover'
require_relative '../interface'
require_relative '../app/compass'

