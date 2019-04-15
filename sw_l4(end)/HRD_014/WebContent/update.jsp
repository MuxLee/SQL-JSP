<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.dbconnection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/index.css"/>
<title>생산관리 조회 & 수정 화면</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		String query = "select code, pname, cost, pnum, jnum, sale, decode(gcode, 'A  ', '컴퓨터', 'B  ', '모바일', 'C  ', '냉장소모품') from product where code = '"+code+"'";
		ResultSet rs = dbconnection.ReRs(query);
	%>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
			<h2>생산관리 조회&수정 화면</h2>
			<form action="action.jsp" method="get">
				<table border="1">
					<colgroup>
						<col width="200px"/>
						<col width="200px"/>
					</colgroup>
					<%
						if (rs.next()) {
					%>
						<tr>
						<th>
							제품코드
						</th>
						<td>
							<input type="text" value="<%=code %>" name="code"/>
						</td>
					</tr>
					<tr>
						<th>
							제품이름
						</th>
						<td>
							<input type="text" value="<%=rs.getString(2) %>" name="pname"/>
						</td>
					</tr>
					<tr>
						<th>
							제품원가
						</th>
						<td>
							<input type="text" value="<%=rs.getString(3) %>" name="cost"/>
						</td>
					</tr>
					<tr>
						<th>
							목표수량
						</th>
						<td>
							<input type="text" value="<%=rs.getString(4) %>" name="pnum"/>
						</td>
					</tr>
					<tr>
						<th>
							재고수량
						</th>
						<td>
							<input type="text" value="<%=rs.getString(5) %>" name="jnum"/>
						</td>
					</tr>
					<tr>
						<th>
							출고가
						</th>
						<td>
							<input type="text" value="<%=rs.getString(6) %>" name="sale"/>
						</td>
					</tr>
					<tr>
						<th>
							그룹이름
						</th>
						<td>
							<select name="gcode">
								<%
									if (rs.getString(7).equals("컴퓨터")) 	{
								%>
										<option value="A">
											<%=rs.getString(7) %>
										</option>
										<option value="B">
											모바일
										</option>
										<option value="C">
											냉장소모품
										</option>
								<%
									}
									else if (rs.getString(7).equals("모바일")) {
								%>
										<option value="B">
											<%=rs.getString(7) %>
										</option>
										<option value="A">
											컴퓨터
										</option>
										<option value="C">
											냉장소모품
										</option>
								<%
									}
									else if (rs.getString(7).equals("냉장소모품")) {
								%>
										<option value="C">
											<%=rs.getString(7) %>
										</option>
										<option value="A">
											컴퓨터
										</option>
										<option value="B">
											모바일
										</option>
								<%
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="조회" name="action"/>
							<input type="submit" value="수정" name="action"/>
							<input type="submit" value="삭제" name="action"/>
							<input type="button" value="메인화면" onClick="location.href='index.jsp'"/>
						</td>
					</tr>
					<%
						}
						else {
					%>
					<tr>
						<th>
							제품코드
						</th>
						<td>
							<input type="text" value="" name="code"/>
						</td>
					</tr>
					<tr>
						<th>
							제품이름
						</th>
						<td>
							<input type="text" value="" name="pname"/>
						</td>
					</tr>
					<tr>
						<th>
							제품원가
						</th>
						<td>
							<input type="text" value="" name="cost"/>
						</td>
					</tr>
					<tr>
						<th>
							목표수량
						</th>
						<td>
							<input type="text" value="" name="pnum"/>
						</td>
					</tr>
					<tr>
						<th>
							재고수량
						</th>
						<td>
							<input type="text" value="" name="jnum"/>
						</td>
					</tr>
					<tr>
						<th>
							출고가
						</th>
						<td>
							<input type="text" value="" name="sale"/>
						</td>
					</tr>
					<tr>
						<th>
							그룹이름
						</th>
						<td>
							<select name="gcode">
								<option value="A">
									컴퓨터
								</option>
								<option value="B">
									모바일
								</option>
								<option value="C">
									냉장소모품
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="조회" name="action"/>
							<input type="button" value="메인화면" onClick="location.href='index.jsp'"/>
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