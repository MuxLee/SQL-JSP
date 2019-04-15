<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.dbconnection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹별 제고 수량 화면</title>
</head>
<body>
	<%
		String query = "select code, decode(gcode, 'A  ', '컴퓨터', 'B  ', '모바일', 'C  ', '냉장소모품') as gcode, JNUM FROM PRODUCT ORDER BY CODE";
		ResultSet rs = dbconnection.ReRs(query);
	%>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
		<h2>그룹별 제고 수량 화면</h2>
		<form>
			<table border="1">
				<colgroup>
					<col width="150px"/>
					<col width="200px"/>
					<col width="200px"/>
				</colgroup>
				<tr>
					<th>
						제품코드
					</th>
					<th>
						그룹이름
					</th>
					<th>
						제고수량
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