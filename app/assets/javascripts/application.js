// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//include("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js");

$(document).ready(function () {
	$(".add_payment").on('click', function (e) {
		e.preventDefault();
		$.ajax({
			type: 'post',
			url: '/payments/add',
			dataType: 'json',
			success: function(data) {
				if(data.result == true)
					location.reload();
			}
		})
	});
	$(".delete-payment").on('click', function (e) {
		e.preventDefault();
		$.ajax({
			type: 'post',
			url: '/payments/delete',
			data: {id: $(this).children(".delete-payment-lnk").attr("data-payment")},
			dataType: 'json',
			success: function(data) {
				if(data.result == true)
					location.reload();
			}
		})
	});
})


