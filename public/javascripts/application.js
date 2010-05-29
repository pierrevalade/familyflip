// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $(document).bind('keyup', 'a', function(){
    window.location = '/albums/new_index';
  })
  $(document).bind('keyup', 'c', function(){
     window.location = '/contacts/new_index';
   })
   $(document).bind('keyup', 'h', function(){
      window.location = '/';
    })
   
});

function go(url) {
  location.href = url;
}