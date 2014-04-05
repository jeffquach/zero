// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery-ui-1.10.4.custom.min
//= require jquery.timepicker.min
//= require bootstrap
//= require_tree .


$(document).ready(function(){
	setTimeout(function(){$('.alerts').remove();}, 2500);
	$('#meetup_start_time').datepicker();
	$('#meetup_end_time').datepicker();
	$('#meetup-start').timepicker({ 'scrollDefaultNow': true });
	$('#meetup-end').timepicker({ 'scrollDefaultNow': true });

	$(".tingz > div:gt(0)").hide();

	setInterval(function() { 
	  $('.tingz > div:first').fadeOut(1000)
	    .next()
	    .fadeIn(1000)
	    .end()
	    .appendTo('.tingz');
	},  3000);
})

// $('.input-append').fdatepicker('show');