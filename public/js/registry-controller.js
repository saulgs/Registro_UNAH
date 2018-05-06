$(document).ready(function(){
    console.log("Main Registro UNAH");
});

$('#btn-login-student').click(function(){
    $.ajax({
        url:"/students/mainStudents",
		method:"POST",
		success: function(response){
            console.log(response);
            location.href = response;
		},
		error: function (e) {
			alert("Ocurrió el siguiente error:"+JSON.stringify(e));
		}
    });
});