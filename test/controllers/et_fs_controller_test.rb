require 'test_helper'

class EtFsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @etf = etfs(:one)
  end

  test "should get index" do
    get etfs_url
    assert_response :success
  end

  test "should get new" do
    get new_etf_url
    assert_response :success
  end

  test "should create etf" do
    assert_difference('Etf.count') do
      post etfs_url, params: { etf: { asset_id: @etf.asset_id, description: @etf.description, name: @etf.name } }
    end

    assert_redirected_to etf_url(Etf.last)
  end

  test "should show etf" do
    get etf_url(@etf)
    assert_response :success
  end

  test "should get edit" do
    get edit_etf_url(@etf)
    assert_response :success
  end

  test "should update etf" do
    patch etf_url(@etf), params: { etf: { asset_id: @etf.asset_id, description: @etf.description, name: @etf.name } }
    assert_redirected_to etf_url(@etf)
  end

  test "should destroy etf" do
    assert_difference('Etf.count', -1) do
      delete etf_url(@etf)
    end

    assert_redirected_to etfs_url
  end
end
