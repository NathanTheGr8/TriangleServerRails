require 'test_helper'

class DjsControllerTest < ActionController::TestCase
  setup do
    @dj = djs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:djs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dj" do
    assert_difference('Dj.count') do
      post :create, dj: { friday: @dj.friday, location: @dj.location, monday: @dj.monday, name: @dj.name, saturday: @dj.saturday, sunday: @dj.sunday, thursday: @dj.thursday, tuesday: @dj.tuesday, wednesday: @dj.wednesday }
    end

    assert_redirected_to dj_path(assigns(:dj))
  end

  test "should show dj" do
    get :show, id: @dj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dj
    assert_response :success
  end

  test "should update dj" do
    patch :update, id: @dj, dj: { friday: @dj.friday, location: @dj.location, monday: @dj.monday, name: @dj.name, saturday: @dj.saturday, sunday: @dj.sunday, thursday: @dj.thursday, tuesday: @dj.tuesday, wednesday: @dj.wednesday }
    assert_redirected_to dj_path(assigns(:dj))
  end

  test "should destroy dj" do
    assert_difference('Dj.count', -1) do
      delete :destroy, id: @dj
    end

    assert_redirected_to djs_path
  end
end
