 # encoding: UTF-8
require 'test_helper'

describe Answer do
  describe '#responses_number' do
    it 'should return 2' do
      input = [nil,"a","b"]
      _(Answer.responses_number(input)).must_equal 2
    end
  end

  describe '#correct' do
    it 'should return 1' do
      questions = [{:answer => "a"},{:answer => "a"},{:answer => "a"}]
      answers = [nil,"a","b"]
      _(Answer.correct(questions,answers)).must_equal 1
    end
  end

  describe '#get_unresolved_question' do
    it 'should return 1 because size = 1' do
      answers = [nil]
      column_questions = 4
      _(Answer.get_unresolved_question(answers,column_questions)).must_equal 1
    end

    it 'should return 3 because size < column_questions' do
      answers = [nil,"a","asd"]
      column_questions = 4
      _(Answer.get_unresolved_question(answers,column_questions)).must_equal 3
    end

    it 'should return 1 because 1 item is nil' do
      answers = ["a",nil,"a","asd"]
      column_questions = 4
      _(Answer.get_unresolved_question(answers,column_questions)).must_equal 1
    end

  end

end