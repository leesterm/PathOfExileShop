$(document).ready(function(){
	$('#register').click(function(){
		$('#register').hide();
		$('#error').hide();
		$('#login').slideUp();
		$('#register-form').slideDown();
	});
});

