$(document).ready(function() {
	$('.js-choose-user-avatar-button').bind("click", function() {
		form = $(this).closest("form");
		form.find(".js-user-avatar-input").click();
	});

	$('.js-user-avatar-input').bind("change", function() {
		form = $(this).closest("form");
		filename = $(this).val().replace(/^.*[\\\/]/, '');
		form.find(".js-avatar-filename").text(filename);	
	});
});