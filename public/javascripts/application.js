// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  document.onselectstart = function() {return false;} // ie
  document.onmousedown = function() {return false;} // mozilla
  
  $(document).bind('keydown', 'a', function(){
    window.location = '/albums/';
  })
  $(document).bind('keydown', 'c', function(){
     window.location = '/contacts/';
   })
   
});

function go(url) {
  location.href = url;
}