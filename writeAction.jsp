<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTITLE" />
<jsp:setProperty name="board" property="boardCONTENT" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<%
	/*
		MultipartRequest multi = new MultipartRequest(request, 
				"C:\\eclipseWorkspace\\used_stuff_market_login_signup\\WebContent\\upload", 
				20 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
	*/
		//
	
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (board.getBoardTITLE() == null || board.getBoardCONTENT() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.write(board.getBoardTITLE(), userID, board.getBoardCONTENT());
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'board_home.jsp'");
						script.println("</script>");
					}
				}
		}


	%>
</body>
</html>