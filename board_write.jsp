<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 css 사용을 위한 import -->
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<title>글쓰기 화면</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar mb-5 navbar-dark bg-dark">
  		<a class="navbar-brand" href="home.jsp">KPU 중고장터</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
  				aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    		<div class="navbar-nav">
      			<a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
				<%
      				if(userID == null) {
      			%>
      						<a class="nav-link" href="login.jsp">로그인 </a>
      						<a class="nav-link" href="signup.jsp">회원가입 </a>
      			<%
      				} else {
      			%>
      						<a class="nav-link" >${userID} 님 환영합니다.</a>
      						<a class="nav-link" href="logoutAction.jsp">로그아웃 </a>
      			<%		
      				}
      			%>
      			<a class="nav-link active" href="board_home.jsp">게시판 </a>
   			</div>
  		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<!-- enctype="multipart/form-data" --> 
				<form method="post" action="writeAction.jsp">
				<table class="table">
			  	<thead>
			  	  <tr>
				      <th scope="col">글쓰기</th>
				    </tr>
				  </thead>
				  <tbody>
				  </tbody>
				</table>
			
				<div class="form-group col-lg-12">
				    <label for="exampleFormControlTextarea1">글 제목 앞에 판매 혹은 구매 태그를 붙여주세요. ex) [판매] 교재 팝니다.</label>
				    <input name="boardTITLE" class="form-control" placeholder="글 제목" maxlength="50">
				</div>
			
				<div class="form-group col-lg-12">
				    <label for="exampleFormControlTextarea1">연락수단은 필수로 남겨주세요. ex) 전화번호, 카카오톡 아이디</label>
				    <textarea name="boardCONTENT" class="form-control" id="exampleFormControlTextarea2" rows="12"
				    placeholder="글 내용" maxlength="2048"></textarea>
				</div>
				
				<div class="input-group col-lg-12">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroupFileAddon01">파일 첨부</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" id="inputGroupFile01" 
				    name = "fileName" aria-describedby="inputGroupFileAddon01">
				    <label class="custom-file-label" for="inputGroupFile01">파일 선택</label>
				  </div>
				</div>
				
				<input type="submit" class="btn btn-dark mt-3 ml-3" value="글쓰기">
				<a class="btn btn-dark mt-3 ml-3" href="board_home.jsp" role="button">취소</a>
				</form>
			</div>
		</div>
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