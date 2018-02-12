require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'app_controller'
require_relative 'index_controller'
require_relative 'questions_controller'

class AnswersController < AppController
  get '/answers' do
    @name = session[:name]
    @answers = session[:answers]
    @questions = settings.questions
    erb :answers
  end

  post '/answers' do
    session[:answers] = []
    session[:name] =  ''
    redirect to('/')
  end
end