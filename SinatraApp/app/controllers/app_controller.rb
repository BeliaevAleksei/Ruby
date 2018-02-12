require 'sinatra'
require 'sinatra/reloader' if development?


require 'sinatra/base'
require_relative "../source/read"
require_relative "../source/answer"

class AppController < Sinatra::Base
  enable :sessions
  set :questions, Read.payment_from_file(File.expand_path('../../source/question.txt', __FILE__))
  set :root, File.expand_path('../..', __FILE__)
end
