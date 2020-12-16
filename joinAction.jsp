<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->

<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 처리</title>
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
		
		if (user.getUserID() == null || user.getUserPassword() == null || 
		user.getUserName() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if (result == -1) { // 아이디가 기본키, 중복되면 오류 -> PRIMARY KEY 이므로 중복되면 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else { // 가입 성공한 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료 되었습니다.')");
				script.println("location.href = 'home.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>