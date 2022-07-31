<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<s:url var="url_jqlib" value="/webapp/js/jquiry-3.2.1.min.jsp"/>
<title>Insert title here</title>
</head>
<body>
<h1>Employee form</h1>

<s:form modelAttribute="addNewEmployee">
   Full Name: <s:input path="fullname"/><br>
   Age:       <s:input path="age"/><br>
   Email:     <s:input path="email"/><br>
   Gender:    <s:input path="gender"/><br>
   Hobby:     <s:input path="hobby"/><br>
   Country:   <s:input path="country"/><br>
   Address:   <s:input path="address"/><br>


</s:form>
</body>
</html>