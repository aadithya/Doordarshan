require 'test_helper'

class ProgramCategoriesControllerTest < ActionController::TestCase
  setup do
    @program_category = program_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_category" do
    assert_difference('ProgramCategory.count') do
      post :create, program_category: { genre_id: @program_category.genre_id, program_id: @program_category.program_id }
    end

    assert_redirected_to program_category_path(assigns(:program_category))
  end

  test "should show program_category" do
    get :show, id: @program_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_category
    assert_response :success
  end

  test "should update program_category" do
    put :update, id: @program_category, program_category: { genre_id: @program_category.genre_id, program_id: @program_category.program_id }
    assert_redirected_to program_category_path(assigns(:program_category))
  end

  test "should destroy program_category" do
    assert_difference('ProgramCategory.count', -1) do
      delete :destroy, id: @program_category
    end

    assert_redirected_to program_categories_path
  end
end
