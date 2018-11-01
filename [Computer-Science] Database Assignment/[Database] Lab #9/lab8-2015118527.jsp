<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>--- Received from main.html the data shown below ---</h2>
		<ul>
			<li><p>My name is
				<b><%= request.getParameter("first_name") %>
					<%= request.getParameter("last_name")%>.</b>
			</p></li>
			<li><p>My student ID is
				<b><%= request.getParameter("sID") %>.</b>
			</p></li>
			<li><p>I am taking
				<b><%= request.getParameter("course") %> this semester.</b>
			</p></li>
		</ul>

</body>
</html>