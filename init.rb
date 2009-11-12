#fails with unknown spec_rails_example_MODELNAME_path in test
if defined? RAILS_ENV and RAILS_ENV != 'test'
  require 'xhr_redirect'

  # add to controller for redirect_to support
  ActionController::Base.send :include, XhrRedirect

  # add to Request for xhr? support
  klass = if defined? ActionController::AbstractRequest
    ActionController::AbstractRequest
  else # post Rails 2.3
    ActionController::Request
  end
  klass.send :include, XhrRedirect::AbstractRequestXhr
end