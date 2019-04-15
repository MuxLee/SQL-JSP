<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.dbconnection" %>
<%@ page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	String query = null;
	PreparedStatement pstmt = null;
	
	switch (action) {
		case "insert":
			query = "insert into product values(?, ?, ?, ?, ?, ? ,?)";
			pstmt = dbconnection.RePstmt(query);
			pstmt.setString(1, request.getParameter("code"));
			pstmt.setString(2, request.getParameter("pname"));
			pstmt.setString(3, request.getParameter("cost"));
			pstmt.setString(4, request.getParameter("pnum"));
			pstmt.setString(5, request.getParameter("jnum"));
			pstmt.setString(6, request.getParameter("sale"));
			pstmt.setString(7, request.getParameter("gcode"));
			pstmt.executeQuery();
			out.println("<script>alert('등록이 완료되었습니다'); location.href='index.jsp';</script>");
			break;
		case "조회":
			response.sendRedirect("update.jsp?code="+request.getParameter("code"));
			break;
		case "수정":
			query = "update product set pname = ?, cost = ?, pnum = ?, jnum = ?, sale = ?, gcode = ? where code = '"+request.getParameter("code")+"'";
			pstmt = dbconnection.RePstmt(query);
			pstmt.setString(1, request.getParameter("pname"));
			pstmt.setString(2, request.getParameter("cost"));
			pstmt.setString(3, request.getParameter("pnum"));
			pstmt.setString(4, request.getParameter("jnum"));
			pstmt.setString(5, request.getParameter("sale"));
			pstmt.setString(6, request.getParameter("gcode"));
			pstmt.executeQuery();
			out.println("<script>alert('수정이 완료되었습니다'); location.href='index.jsp';</script>");
			break;
		case "삭제":
			query = "delete from product where code = '"+request.getParameter("code")+"'";
			pstmt = dbconnection.RePstmt(query);
			pstmt.executeQuery();
			out.println("<script>alert('삭제가 완료되었습니다'); location.href='index.jsp';</script>");
			break;
	}
%>