With xhr_redirect redirected xhr requests (read: ajax requests) stay xhr --> `request.xhr? == true`

### Details
 - When an xhr request is redirected, _xhr=1 will be added to the parameters
 - Request with _xhr=1 are recognised as xhr ( also enhances testablility, simulate xhr responses by adding _xhr=1 )

Install
=======
    script/plugin install git://github.com/grosser/xhr_redirect.git

TODO
====
 - find a more elegant solution

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...
