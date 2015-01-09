require 'test_helper'

class ActivesControllerTest < ActionController::TestCase
  setup do
    @active = actives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create active" do
    assert_difference('Active.count') do
      post :create, active: { email: @active.email, first: @active.first, inhouse: @active.inhouse, last: @active.last, major: @active.major, middle: @active.middle, phone: @active.phone, pledgeclass: @active.pledgeclass, year: @active.year }
    end

    assert_redirected_to active_path(assigns(:active))
  end

  test "should show active" do
    get :show, id: @active
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @active
    assert_response :success
  end

  test "should update active" do
    patch :update, id: @active, active: { email: @active.email, first: @active.first, inhouse: @active.inhouse, last: @active.last, major: @active.major, middle: @active.middle, phone: @active.phone, pledgeclass: @active.pledgeclass, year: @active.year }
    assert_redirected_to active_path(assigns(:active))
  end

  test "should destroy active" do
    assert_difference('Active.count', -1) do
      delete :destroy, id: @active
    end

    assert_redirected_to actives_path
  end
end
