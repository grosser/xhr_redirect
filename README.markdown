Xhr Redirect
=============
Normally when a xhr request is redirected, it is no longer xhr.  
This causes all kinds of trouble when working with js requests.  
Normally the JS framework should handle these redirects, and simply display  
the redirected result, instead the result is a normal request.  

 - When an xhr request is redirected, _xhr=1 will be added to the parameters
 - When a request with _xhr=1 comes in it as recognised as xhr request (also enhances testablility)

Install
=======
    script/plugin install git://github.com/grosser/xhr_redirect.git

TODO
====
 - find a more elegant solution
 - tests (works fine since > 1 year on production servers...)

Author
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  
