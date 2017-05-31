<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="org.json.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>userCollect</title>
</head>
<body>
	<%
		JSONArray arr=(JSONArray) request.getSession().getAttribute("userCollect");
		
		 for (int i = 0; i < arr.length(); i++) {
			 out.println(arr.get(i));
	     }
	%>
</body>
</html>