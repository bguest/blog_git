ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'


Bundler.require :default, ENV['RACK_ENV'].to_sym

require './blog_git'
run Sinatra::Application
