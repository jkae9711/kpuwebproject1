<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->

<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		
		if (userID != null) {
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('이미 로그인이 되어 있습니다.')");
			outter.println("location.href = 'home.jsp'");
			outter.println("</script>");
		}
		
		//
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if (result == 1) { // 로그인 성공
			session.setAttribute("userID", user.getUserID());
			
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('로그인 되었습니다.')");
			outter.println("location.href = 'home.jsp'");
			outter.println("</script>");
		}
		else if (result == 0) { // 로그인 실패
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('비밀번호가 틀립니다.')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		else if (result == -1) { // 아이디 없음, 로그인 실패
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('존재하지 않는 아이디 입니다.')");
			outter.println("</script>");
		}
		else if (result == -2) { // DB 에러
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("alert('DB 오류가 발생했습니다')");
			outter.println("history.back()");
			outter.println("</script>");
		}
		
	%>
</body>
</html>