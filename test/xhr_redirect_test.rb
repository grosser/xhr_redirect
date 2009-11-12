require 'test/test_helper'

class XhrController < ActionController::Base
  def go
    redirect_to :action => :test
  end

  def multi_string
    redirect_to "/xhr/test?x=2"
  end

  def multi_hash
    redirect_to :action => :test, :x => 2
  end

  def back
    redirect_to :back
  rescue Exception => e
    render :text => e.class
  end

  def test_nil
    redirect_to nil
  rescue Exception => e
    render :text => e.message
  end

  def test
    render :text => request.xhr?
  end
end

class XhrRedirectTest < ActionController::TestCase
  def setup
    @controller = XhrController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  test "it is not xhr for normal requests" do
    get :test, :something => '1'
    assert_equal 'false', @response.body
  end

  test "it is xhr for xhr requests" do
    xhr :get, :test, :something => '1'
    assert_equal 'true', @response.body
  end

  test "it is xhr for xhr redirects" do
    xhr :get, :go
    assert_equal @response.redirect_url, "http://test.host/xhr/test?_xhr=1"
    get :test, :_xhr => '1'
    assert_equal 'true', @response.body
  end

  test "it adds correctly for multiple parameters on string" do
    xhr :get, :multi_string
    assert_equal "http://test.host/xhr/test?x=2&_xhr=1", @response.redirect_url
  end

  test "it adds correctly for multiple parameters on hash" do
    xhr :get, :multi_hash
    assert_equal "http://test.host/xhr/test?x=2&_xhr=1", @response.redirect_url
  end

  test "it adds correctly for back redirects" do
    @request.env['HTTP_REFERER'] = 'http://test.host/xhr/test'
    xhr :get, :back
    assert_equal "http://test.host/xhr/test?_xhr=1", @response.redirect_url
  end

  test "it raises as normal when no referrer was given" do
    xhr :get, :back
    assert_equal "ActionController::RedirectBackError", @response.body
  end

  test "it raises as normal when nil was given" do
    xhr :get, :test_nil
    assert_match /cannot redirect to nil/i, @response.body
  end
end