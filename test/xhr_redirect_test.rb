require 'rubygems'
require 'actionpack'
require 'action_controller'
require 'action_controller/test_process'
require 'test/unit'

$LOAD_PATH << 'lib'

# fake rails env for initialisation
RAILS_ENV='development'
module Rails
  module VERSION
    STRING = '2.3.2'
  end
end

require "init"

#ActionController::Base.logger = nil
#ActionController::Routing::Routes.reload rescue nil

class XhrController < ActionController::Base
end

class XhrRedirectTest < ActionController::TestCase
  def setup
    @controller = XhrController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
end