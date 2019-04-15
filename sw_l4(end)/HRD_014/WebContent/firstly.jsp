<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.dbconnection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우선 생산 제품 화면</title>
</head>
<body>
	<%
		String query = "SELECT CODE, PNAME, ((PNUM*0.2)-JNUM) FROM PRODUCT WHERE (PNUM*0.2) > JNUM";
		ResultSet rs = dbconnection.ReRs(query);
	%>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
		<h2>우선 생산 제품 화면</h2>
		<form>
			<table border="1">
				<colgroup>
					<col width="100px"/>
					<col width="200px"/>
					<col width="300px"/>
				</colgroup>
				<tr>
					<th>
						제품코드
					</th>
					<th>
						제품이름
					</th>
					<th>
						추가생산량(20%이상)
					</th>
				</tr>
				<%
					while (rs.next()) {
				%>
						<tr>
							<td>
								<%=rs.getString(1) %>
							</td>
							<td>
								<%=rs.getString(2) %>
							</td>
							<td>
								<%=rs.getString(3) %>
							</td>
						</tr>
				<%
					}
				%>
			</table>
		</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>