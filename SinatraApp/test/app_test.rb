
require_relative 'test_helper'

class AppTestCase < CapybaraTestCase
  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_should_contain_a_greeting
    visit('/')
    assert_text 'Hello, enter your name in order to start the test for erudition'
    assert_text('Name')
  end

  def test_should_enter_user_name_and_redirect
    visit('/')
    fill_in('Name:', with: 'Niki')
    click_on('Ready')
    assert_equal '/questions/0', page.current_path
    
  end
end
