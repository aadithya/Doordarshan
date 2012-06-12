require 'test_helper'

class ProgramGenresControllerTest < ActionController::TestCase
  setup do
    @program_genre = program_genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_genre" do
    assert_difference('ProgramGenre.count') do
      post :create, program_genre: {  }
    end

    assert_redirected_to program_genre_path(assigns(:program_genre))
  end

  test "should show program_genre" do
    get :show, id: @program_genre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_genre
    assert_response :success
  end

  test "should update program_genre" do
    put :update, id: @program_genre, program_genre: {  }
    assert_redirected_to program_genre_path(assigns(:program_genre))
  end

  test "should destroy program_genre" do
    assert_difference('ProgramGenre.count', -1) do
      delete :destroy, id: @program_genre
    end

    assert_redirected_to program_genres_path
  end
end
