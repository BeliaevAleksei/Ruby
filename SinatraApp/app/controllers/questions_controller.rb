require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'app_controller'
require_relative 'answers_controller'
require_relative 'index_controller'

class QuestionsController < AppController
  get '/questions/:id' do
    @questions = settings.questions
    @id = params['id']
    @name = session[:name]
    @responses_number = Answer.responses_number(session[:answers])
    @correct_responses = Answer.correct(settings.questions, session[:answers])
    @answers = session[:answers]
    erb :questions
  end

  post '/questions/:id' do
    @id = params['id'].to_i
    session[:answers][@id] = params['optradio']
    @responses_number = Answer.responses_number(session[:answers])
    @id += 1
    if @responses_number == settings.questions.size
      then redirect to('/answers')
    else
      @linq = Answer.get_unresolved_question(session[:answers], settings.questions.size)
      redirect to("/questions/#{@linq}")
    end
  end

end