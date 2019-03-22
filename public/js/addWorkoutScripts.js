function switchType(val){
	if(val == "Cardio"){
		$('#flex_workout').hide();
		$('#weight_workout').hide();
		$('#cardio_workout').show();
	}else if(val == "Weight"){
		$('#flex_workout').hide();
		$('#weight_workout').show();
		$('#cardio_workout').hide();
	}else if(val == "Flexibility"){
		$('#flex_workout').show();
		$('#weight_workout').hide();
		$('#cardio_workout').hide();
	}
}

$('document').ready(function(){
	$('#flex_workout').hide();
	$('#weight_workout').hide();
	$('input[name="workoutType"]').change(function(){
		switchType($(this).val());
	})
});