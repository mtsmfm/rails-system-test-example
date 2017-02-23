// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's 
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .

setTimeout(function () {
  var r = new XMLHttpRequest();
  r.open('POST', '/posts', true);
  var token = document.querySelector('meta[name="csrf-token"]');
  if (token) {
    r.setRequestHeader('X-CSRF-TOKEN', token.getAttribute('content'));
  }
  var formData = new FormData();
  formData.append("post[title]", "a");
  r.send(formData);
}, 1);
