require 'sinatra'
require 'sinatra/reloader' if development?


require_relative 'app_controller'
require_relative 'answers_controller'
require_relative 'questions_controller'

class IndexController < AppController
  
  get '/' do
    erb :index
  end

  post '/index' do
    session[:name] = params['name']
    session[:answers] = []
    redirect to('/questions/0')
  end
end