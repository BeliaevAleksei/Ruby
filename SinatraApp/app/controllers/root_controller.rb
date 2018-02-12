require 'sinatra/multi_route'

require_relative 'app_controller'
require_relative 'answers_controller'
require_relative 'index_controller'
require_relative 'questions_controller'

class RootController < AppController
  register Sinatra::MultiRoute

  get('/') { IndexController.call(env) }

  route :get, :post, '/index' do
    IndexController.call(env)
  end

  route :get, :post, '/answers' do
    AnswersController.call(env)
  end

  route :get, :post, '/questions/*' do
    QuestionsController.call(env)
  end

end