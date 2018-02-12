require_relative 'capibara_helper'

class AppTestCase < CapybaraTestCase
  def setup
    Capybara.app = RootController.new
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
    assert_text('Niki')
  end

  def test_should_enter_one_correct_answer
    visit('/questions/0')
    choose('a ) Galaxy')
    visit('/answers')
    has_selector?('.text-success', :text => 'a ) Galaxy', :visible => true)
  end 

  def test_should_enter_one_wrong_answer
    visit('/questions/0')
    choose('b ) Cluster of stars')
    visit('/answers')
    has_selector?('.text-danger', :text => 'b ) Cluster of stars', :visible => true)
    click_on('Try Again')
    assert_equal '/', page.current_path
  end

  def test_should_rederect_to_next_page
    visit('/questions/0')
    choose('b ) Cluster of stars')
    find_button('Accept').click
    assert_equal '/questions/1', page.current_path
  end

  def test_should_rederect_to_2_page
    visit('/questions/0')
    click_on('2')
    assert_equal '/questions/2', page.current_path
  end

end
