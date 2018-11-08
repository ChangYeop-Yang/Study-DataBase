<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COMP322003/004: Databases</title>
</head>
<body>
	<h2>Lab #9: Repeating Lab #5-3 Using JSP</h2>
	
	<%
		String serverIP = "localhost";
		String strSID = "orcl";
		String portNum = "1521";
		String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
		String user = "knu";
		String pass = "comp322";
		
		Connection conn;
		PreparedStatement pstmt1, pstmt2, pstmt3;
		ResultSet rs;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String Query1 = "SELECT EMPLOYEE.FNAME, EMPLOYEE.MINIT, EMPLOYEE.LNAME FROM EMPLOYEE, PROJECT WHERE PROJECT.PNAME = '" + request.getParameter("projectName") + "'" + " AND EMPLOYEE.DNO = " + request.getParameter("dNum") + " AND EMPLOYEE.SALARY >= " + request.getParameter("Salary");
		String Query2 = "SELECT FNAME, LNAME FROM EMPLOYEE WHERE SSN = '" + request.getParameter("SSN") + "' AND ADDRESS LIKE " + "'%" + request.getParameter("Address") + "%'";
		String Query3 = "SELECT LNAME FROM EMPLOYEE WHERE DNO = (SELECT DNUM FROM PROJECT WHERE PNAME = '" + request.getParameter("selectProjectName") + "')";
		
		/* QUERY 1 */
		pstmt1 = conn.prepareStatement(Query1);
		rs = pstmt1.executeQuery();

		out.println("</br><h3>----- Q1 Result -----</h3></br>");

		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();

		int cnt = rsmd.getColumnCount();
		for (int ii = 1; ii <= cnt; ii++) {
			out.println("<th>" + rsmd.getColumnName(ii) + "</th>");
		}

		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("<td>" + rs.getString(3) + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");

		/* QUERY 2 */
		pstmt2 = conn.prepareStatement(Query2);
		rs = pstmt2.executeQuery();

		out.println("</br><h3>----- Q2 Result -----</h3></br>");

		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd1 = rs.getMetaData();

		int cnt1 = rsmd1.getColumnCount();
		for (int ii = 1; ii <= cnt1; ii++) {
			out.println("<th>" + rsmd1.getColumnName(ii) + "</th>");
		}

		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");

		/* QUERY 3 */
		pstmt3 = conn.prepareStatement(Query3);
		rs = pstmt3.executeQuery();

		out.println("</br><h3>----- Q3 Result -----</h3></br>");

		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd2 = rs.getMetaData();

		int cnt2 = rsmd2.getColumnCount();
		for (int ii = 1; ii <= cnt2; ii++) {
			out.println("<th>" + rsmd2.getColumnName(ii) + "</th>");
		}

		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");

		pstmt1.close();
		pstmt2.close();
		pstmt3.close();

		conn.close();
	%>
	
</body>
</html>