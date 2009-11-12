module XhrRedirect
  module AbstractRequestXhr
    def self.included(base)
      base.class_eval do
        alias_method_chain :xml_http_request?, :xhr    
        alias :xhr? :xml_http_request_with_xhr? # was alias for xml_http_request?
      end
    end

    def xml_http_request_with_xhr?
      !!(parameters['_xhr'] or xml_http_request_without_xhr?)
    end
  end
end