delay = (ms, func) -> setTimeout func, ms

jQuery(document).ready ->
	$('#signupform').submit (e) ->
		e.preventDefault()

		$email = $("#email").val()
		if $email == ""
			$("#email").attr 'placeholder', 'Din addresse her'
			$("#submit").addClass 'shake'
			$("#submit").addClass 'animated'
			delay 1000, ->
				$("#submit").removeClass 'shake'
				$("#submit").removeClass 'animated'
				

			return

		$("#email").attr 'disabled', 'disabled'
		$("#submit").attr 'disabled', 'disabled'

		$.post '/invite.php', "email=" + $email, (data, status, xhr) ->
			console.log(data)
			$('#email_label').hide()
			$("#email").val 'Din invitation er på vej'
			$("#submit").fadeOut()