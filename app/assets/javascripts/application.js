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
//= require foundation
//= require jquery.ui.datepicker
//= require jquery.ui.tooltip
//= require jquery-ui-1.10.4.custom.min
//= require jquery.timepicker.min
//= require_tree .


$(document).ready(function(){
	$(document).foundation();
	setTimeout(function(){$('.alerts').remove();}, 5000);
	$('#meetup_start_time').datepicker();
	$('#meetup_end_time').datepicker();
	$('#meetup-start').timepicker({ 'scrollDefaultNow': true });
	$('#meetup-end').timepicker({ 'scrollDefaultNow': true });
})

// $('.input-append').fdatepicker('show');