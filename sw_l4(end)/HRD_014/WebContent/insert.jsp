<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산관리 등록화면</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
			<h2>생산관리 등록화면</h2>
			<form action="action.jsp" method="post">
				<table border="1">
					<colgroup>
						<col width="200px"/>
						<col width="200px"/>
					</colgroup>
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
							<input type="submit" value="등록" id="submit"/>
							<input type="button" value="메인화면" onClick="location.href='index.jsp'"/>
						</td>
					</tr>
				</table>
				<input type="hidden" value="insert" name="action"/>
			</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>