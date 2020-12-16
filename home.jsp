<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import = "java.io.PrintWriter" %>

<%@ taglib prefix="id" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>

<html>

<head>
	<!-- 부트스트랩 css 사용을 위한 import -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	
	<title>메인 홈</title>
</head>

<body>
	<%
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
			session.setMaxInactiveInterval(20*60);
		}
	%>
	
	<%
		if (userID == null) {
			
	%>

	<nav class="navbar navbar-dark bg-dark">
  		<a class="navbar-brand" href="home.jsp">KPU 중고장터</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    		<div class="navbar-nav">
      			<a class="nav-link active" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      			<a class="nav-link" href="login.jsp">로그인 </a>
      			<a class="nav-link" href="signup.jsp">회원가입 </a>
      			<a class="nav-link" href="board_home.jsp">게시판 </a>
   			</div>
  		</div>
	</nav>
	
	<%
		}
		else {
			
	%>
	
	<nav class="navbar navbar-dark bg-dark">
  		<a class="navbar-brand" href="home.jsp">KPU 중고장터</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    		<div class="navbar-nav">
      			<a class="nav-link active" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      			<a class="nav-link" ><id:id/> 님 환영합니다.</a>
      			<a class="nav-link" href="logoutAction.jsp">로그아웃 </a>
      			<a class="nav-link" href="board_home.jsp">게시판 </a>
   			</div>
  		</div>
	</nav>
	
	<%
		}
	%>
	
	<div class="jumbotron">
  		<h1 class="display-4">중고거래 웹 사이트에 오신 것을 환영합니다!</h1>
  		<p></p>
  		<p class="lead">교재, 족보, 개인 물품, 수업 기자재 등 모든 것들을 거래할 수 있습니다.</p>
  		<hr class="my-4">
  		<p class="lead">사이트 이용을 위해서는 로그인이 필요합니다.</p>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- JQeury 라이브러리 사용을 위해 인터넷에서 받아와 로드시키도록 함 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Popper.js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- 부트스트랩 js 사용을 위한 import -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>