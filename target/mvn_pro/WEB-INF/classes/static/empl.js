	let tableBody = $("#employeeTable");
	
		$.ajax({
		method: "GET",
		url:     "http://localhost:8080/mvn_pro/rest/list"
	}).then(function(response){
		var employee_data = "";
		$.each(response, function(key, value) {
			employee_data += '<tr>';
			employee_data += '<td>'+ value.fullname +'</td>';
			employee_data += '<td>'+ value.age +'</td>';
			employee_data += '<td>'+ value.email +'</td>';
			employee_data += '<td>'+ value.gender +'</td>';
			employee_data += '<td>'+ value.hobby +'</td>';
			employee_data += '<td>'+ value.country +'</td>';
			employee_data += '<td>'+ value.address +'</td>';
		});
		$('#employeeTable').append(employee_data);
		
	});