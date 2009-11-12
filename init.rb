#fails with unknown spec_rails_example_MODELNAME_path in test
if RAILS_ENV!='test'
  require 'xhr_redirect'
  ActionController::Base.send :include, XhrRedirect
  if Rails::VERSION::STRING >= '2.3.0'
    ActionController::Request.send :include, XhrRedirect::AbstractRequestXhr
  else
    ActionController::AbstractRequest.send :include, XhrRedirect::AbstractRequestXhr
  end
end