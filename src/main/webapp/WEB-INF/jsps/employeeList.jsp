<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://wwww.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css" >
 .popup, .popupUpdateForm{
    position: fixed;
    top: 0px;
    left: 0px;
    background: rgba(0, 0, 0, 0.58);
    width: 100%;
    height: 100%;
    display: none;
  }
 
  /* Popup inner div */
  .popup-content, .popupUpdateForm-content {
    width: 600px;
    margin: 0 auto;
    padding: 40px;
    margin-top: 100px;
    border-radius: 3px;
    background: #fff;
    position: relative;
  }</style>
<head>
<meta http-equiv="Content-Type" content="text/html charset=ISO-8859-1">

<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
 </script>  
</head>
<body>
<script type="text/javascript">
	$.ajaxSetup({
    	cache: false
	}); 
	
	let tableBody = $("#employeeTable");
	let employee_data = null;
	let id;
	let fullname;
	let age;
	let email;
	let gender;
	let hobby;
	let country;
	let address;
	
	renderTable();

    $(document).ready(function(){   //function for open popup(add, update)
	$('#mainDiv').on('click', ':button', function(event) {
		let btnId = this.id;
		let empId = btnId.substring(6,btnId.length);
		
		if(btnId.substring(0, 6) === "update") {
			let id = $(this).closest('tr').find('td:eq(0)').text();
			let fullname = $(this).closest('tr').find('td:eq(1)').text();
			let age = $(this).closest('tr').find('td:eq(2)').text();
			let gender = $(this).closest('tr').find('td:eq(3)').text();
			let email = $(this).closest('tr').find('td:eq(4)').text();
			let hobby = $(this).closest('tr').find('td:eq(5)').text();
			let country = $(this).closest('tr').find('td:eq(6)').text();
			let address = $(this).closest('tr').find('td:eq(7)').text();
			
			renderUpdateForm(id, fullname, age, gender, email, hobby, country, address);
			$('.popupUpdateForm').fadeIn(300);
		} else if(btnId.substring(0, 3) === "add")
			openPopupAddForm();
		    $('.popup').fadeIn(300);
			});
    })
    
    function renderUpdateForm(id, fullname, age, gender, email, hobby, country, address){  // function for render updateForm
		let temp = 
			'<form class="form" id="popupUpdateForm">' +
		    	'ID:  <input type="text" name="id" id="id" value="'+ id + '" readonly/><br>' +
			  'Full Name:  <input type="text" name="fullname" id="fullname" value="'+ fullname + '"/><br>' +
			  'Age:        <input type="text" name="age" id="age" value="' + age + '"/><br>' +
			  'Email:      <input type="text" name="email" id="email" value="' + gender + '"/><br>' +
			  'Hobby:      <input type="text" name="hobby" id="hobby" value="' + hobby +'"/><br>' + 
			  'Gender:     <input type="text" name="gender" id="gender" value="' + gender + '"/><br>' +
			  'Country:    <input type="text" name="country" id="country" value="' + country + '"/><br>' +
			  'Address:    <input type="text" name="address" id="address" value="' + address + '"/><br>' +
			  '<button class="submitUpdateForm" type="submit"  id="submitUpdateBtn">Submit</button>' +
			'</form>';
			$('#updateForm').append(temp);		
    }
    
    function openPopupAddForm() {    //function for build popup add form
    	let html = 
    		'<form class="form" id="popupForm">' + 
    		 '<input type="text" name="id" id="id" hidden/><br>' +
    		 'Full Name:  <input type="text" name="fullname" id="fullname"/><br>' +
    		 'Age:        <input type="text" name="age" id="age"/><br>' +
    		 'Email:      <input type="text" name="email" id="email"/><br>' + 
    		 'Hobby:      <input type="text" name="hobby" id="hobby"/><br>' + 
    		 'Gender:     <input type="text" name="gender" id="gender"/><br>' +
    		 'Country:    <input type="text" name="country" id="country"/><br>' +
    		 'Address:    <input type="text" name="address" id="address"/><br>' +
    		'</form>' +
    	    '<button class="submitBtn" type="submit" id="submitBtn">Submit</button>';
    		$('#addForm').append(html);
    }
   
	function renderTable(){  // function for GET request
		$.ajax({
			cache:  false,
    		method: "GET",
    		url:     "http://localhost:8080/mvn_pro/rest/list",
    		contentType: "application/json"
		}).then(function(response){

			$.each(response, function(key, value) {
		
			employee_data += '<tr id="row' + value.id + '">';
			employee_data += '<td>'+ value.id +'</td>';
			employee_data += '<td>'+ value.fullname +'</td>';
			employee_data += '<td>'+ value.age +'</td>';
			employee_data += '<td>'+ value.email +'</td>';
			employee_data += '<td>'+ value.gender +'</td>';
			employee_data += '<td>'+ value.hobby +'</td>';
			employee_data += '<td>'+ value.country +'</td>';
			employee_data += '<td>'+ value.address +'</td>';
			employee_data += '<td><button class="btn" type="button" id="delete' + value.id + '" onclick="deleteEmployee(this.id);">' +  'Delete' + '</button>';
			employee_data += '<td><button class="btn" type="button" id="update' + value.id + '">' +  'Update' + '</button>';
		})
			$('#employeeTable').append(employee_data);
		});
	}
    
	function deleteEmployee(id){   //function for DELETE request
		let employeeId = id.substring(6, id.length);
		$.ajax({
			type:    "DELETE",
			url:     "http://localhost:8080/mvn_pro/rest/delete/" + employeeId,
		    success: location.reload()	   
		});
	}
	
	$(document).ready(function(){   //function for grab form input and send POST, PUT requests
	$('#mainDiv').on('click', ':submit', function(e){
		e.preventDefault();
	
		let submitBtnId = this.id;
		let selector;
		let method;
		let url;
		let empData1 = {
			"fullname"  : fullname,
			"age"       : age,
			"email"     : email,
			"hobby"     : hobby,
			"gender"    : gender,
			"country"   : country,
			"address"   : address,
			}
    
		if(submitBtnId == "submitUpdateBtn") {
			selector = $('#popupUpdateForm input[type="text"]');
			let empData = grabFormData(selector);
	    	method = "PUT";
	    	url = "http://localhost:8080/mvn_pro/rest/update";
	    	empData["id"] = id;
	    	postPutRequest(url, method, empData);
	    	$('.popupUpdateForm').remove(); 
	    
		} else if(submitBtnId == "submitBtn") {
			selector = $('#popupForm input[type="text"]');
			let empData = grabFormData(selector);
			method = "POST";
	    	url = "http://localhost:8080/mvn_pro/rest/addNewEmployee";
	    	postPutRequest(url, method, empData);
	    	$('.popup').remove();
		}
 	});
	}) 

 	function grabFormData(selector){   // function takes form`s data
 	let dataFromForm = selector.map(function() {
		return this.value;
	}).get();
 	
	id = dataFromForm[0];
	fullname = dataFromForm[1];
	age = dataFromForm[2];
	email = dataFromForm[3];
	hobby = dataFromForm[4];
	gender = dataFromForm[5];
	country = dataFromForm[6];
	address = dataFromForm[7];
	
 	return {
		"fullname"  : fullname,
		"age"       : age,
		"email"     : email,
		"hobby"     : hobby,
		"gender"    : gender,
		"country"   : country,
		"address"   : address,
		}
	}
 	
 	function postPutRequest(url, method, empData) {  // ajax POST, PUT
		console.log(url, method, empData);
		$.ajax({
			method     : method,
			url        : url,
			data       : JSON.stringify(empData),
			dataType   : 'json',
			contentType: "application/json",
			success    : location.reload()
		})
	}
</script>
    
<div class="mainDiv" id="mainDiv">    
<button class="openAddForm" id="addBtn">NEW</button>    
<h1>List of employees</h1>

<table>
<thead>
<tr>
<th>ID</th>
<th>Full Name</th>
<th>Age</th>
<th>Email</th>
<th>Gender</th>
<th>Hobby</th>
<th>Country</th>
<th>Address</th>
<th>Delete</th>
<th>Update</th>
</tr>
</thead>
<tbody id="employeeTable">

</tbody>
</table>


<div id="addForm" class="popup">
</div>
<div id="updateForm" class="popupUpdateForm">  
</div>
</div>
<!-- <script type="text/javascript" src="/resources/static/js/empl.js"> </script> -->
</body>
</html>