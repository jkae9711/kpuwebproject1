<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>
	<!-- 부트스트랩 css 사용을 위한 import -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
	
	<title>회원가입 화면</title>
</head>

<body>
	<nav class="navbar mb-5 navbar-dark bg-dark">
  		<a class="navbar-brand" href="home.jsp">KPU 중고장터</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    		<div class="navbar-nav">
      			<a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      			<a class="nav-link" href="login.jsp">로그인 </a>
      			<a class="nav-link active" href="signup.jsp">회원가입 </a>
      			<a class="nav-link" href="board_home.jsp">게시판 </a>
   			</div>
  		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				
			</div>
			
			<div class="col-lg-4">
				<div class="shadow p-3 mt-5 bg-white rounded">
					<form method="post" action="joinAction.jsp">
					  <div class="form-group">
					    <label for="exampleInputEmail1">이름</label>
					    <input type="text" name="userName" class="form-control" maxlength = "20" required>
					  </div>
					
					  <div class="form-group">
					    <label for="exampleInputEmail1">아이디</label>
					    <input type="text" name="userID" class="form-control" maxlength = "20" required>
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputPassword1">비밀번호</label>
					    <input type="password" name="userPassword" class="form-control" maxlength = "20" required>
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputPassword2">비밀번호 확인</label>
					    <input type="password" name="userPasswordcheck" class="form-control" maxlength = "20" required>
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1">이메일</label>
					    <input type="email" name="userEmail" class="form-control" maxlength = "50" required>
					  </div>
					  
					  <div class="form-group form-check">
					    <input type="checkbox" class="form-check-input" id="exampleCheck1">
					    <label class="form-check-label" for="exampleCheck1">개인정보 취급방침에 동의하십니까?</label>
					  </div>
					  
					  <button type="submit" class="btn btn-dark">회원가입</button>
					</form>
				</div>
			</div>
			
			<div class="col-lg-4">
				
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