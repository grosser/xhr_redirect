require 'rubygems'
require 'actionpack'
require 'action_controller'
require 'action_controller/test_process'
require 'test/unit'
require 'redgreen' rescue nil

$LOAD_PATH << 'lib'

# fake rails env for initialisation
# when Rails is defined, backtrace_cleaner is used, when assert fails
RAILS_ENV='development'
module Rails
  module VERSION
    STRING = '2.3.2'
  end

  def self.backtrace_cleaner(*args)
    FakeCleaner.new
  end
end

class FakeCleaner
  def clean(arg)
    arg
  end
end

ActionController::Routing::Routes.reload

require "init"