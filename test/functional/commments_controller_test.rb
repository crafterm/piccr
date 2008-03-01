require File.dirname(__FILE__) + '/../test_helper'
require 'commments_controller'

# Re-raise errors caught by the controller.
class CommmentsController; def rescue_action(e) raise e end; end

class CommmentsControllerTest < Test::Unit::TestCase
  fixtures :commments

  def setup
    @controller = CommmentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:commments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_commment
    assert_difference('Commment.count') do
      post :create, :commment => { }
    end

    assert_redirected_to commment_path(assigns(:commment))
  end

  def test_should_show_commment
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_commment
    put :update, :id => 1, :commment => { }
    assert_redirected_to commment_path(assigns(:commment))
  end

  def test_should_destroy_commment
    assert_difference('Commment.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to commments_path
  end
end
