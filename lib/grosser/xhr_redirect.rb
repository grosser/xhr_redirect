module Grosser
  module XhrRedirect
    def self.included(base)
      base.class_eval do
        alias_method_chain :redirect_to, :xhr
      end
    end
    
    #add _xhr to redirect paths
    def redirect_to_with_xhr(options={},response_status={})
      if request.xhr?
        case options 
          when %r{^\w+://.*|/} then return redirect_to_without_xhr(url_plus_xhr(options),response_status)
          when :back 
            if request.env["HTTP_REFERER"]
              return redirect_to_without_xhr(url_plus_xhr(request.env["HTTP_REFERER"]), :status=>status)
            end  
            raise(RedirectBackError)
        end
      end
      redirect_to_without_xhr(options,response_status) 
    end
    
    def url_plus_xhr(url)
      case url
        when /_xhr/ then url
        when /\?/ then url + '&_xhr=1'
        else url + '?_xhr=1'
      end
    end
  end
end