#fails with unknown spec_rails_example_MODELNAME_path in test
if RAILS_ENV!='test'
  ActionController::Base.send :include, Grosser::XhrRedirect
  if RAILS_GEM_VERSION > '2.1.0'
    ActionController::Request.send :include, Grosser::AbstractRequestXhr
  else
    ActionController::AbstractRequest.send :include, Grosser::AbstractRequestXhr
  end
end