require File.dirname(__FILE__) + '/../test_helper'
require 'sessions_controller'

# Re-raise errors caught by the controller.
class SessionsController; def rescue_action(e) raise e end; end

class SessionsControllerTest < Test::Unit::TestCase
  fixtures :sessions

  def setup
    @controller = SessionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:sessions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_session
    assert_difference('Session.count') do
      post :create, :session => { }
    end

    assert_redirected_to session_path(assigns(:session))
  end

  def test_should_show_session
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_session
    put :update, :id => 1, :session => { }
    assert_redirected_to session_path(assigns(:session))
  end

  def test_should_destroy_session
    assert_difference('Session.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to sessions_path
  end
end
