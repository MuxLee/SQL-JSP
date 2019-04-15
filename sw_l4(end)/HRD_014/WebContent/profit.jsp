<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.dbconnection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이익 순위 제품 화면</title>
</head>
<body>
	<%
		String query = "SELECT ROWNUM, CODE, PNAME, TOTAL FROM (SELECT CODE, PNAME, JNUM*SALE AS TOTAL FROM PRODUCT ORDER BY TOTAL DESC)";
		ResultSet rs = dbconnection.ReRs(query);
	%>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
		<h2>이익 순위 제품 화면</h2>
		<form>
			<table border="1">
				<colgroup>
					<col width="50px"/>
					<col width="100px"/>
					<col width="150px"/>
					<col width="200px"/>
				</colgroup>
				<tr>
					<th>
						순위
					</th>
					<th>
						제품코드
					</th>
					<th>
						제품이름
					</th>
					<th>
						예상 재고 판매 총 이익
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
							<td>
								<%=rs.getString(4) %>
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