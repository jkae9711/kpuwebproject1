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
<title>게시판 메인</title>
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
		<div class="row mb-3">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
							BoardDAO boardDAO = new BoardDAO();
							ArrayList<Board> list = boardDAO.getList(pageNumber);
							for(int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%= list.get(i).getBoardID() %></td>
							<td><a href="view.jsp?boardID=<%=list.get(i).getBoardID() %>"><%= list.get(i).getBoardTITLE().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBoardDATE().substring(0, 11) + list.get(i).getBoardDATE().substring(11, 13) + "시 " + list.get(i).getBoardDATE().substring(14, 16) + "분" %></td>
							<td><%= list.get(i).getBoardVIEWS() %></td>
						</tr>
						<%		
							}
						%>
					</tbody>
				</table>
				<%
					if(pageNumber != 1) {
				%>
					<a href="board_home.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-dark btn-arraw-left">이전</a>
				<%
					} if(boardDAO.naxtPage(pageNumber + 1)) {
				%>		
					<a href="board_home.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-dark btn-arraw-left">다음</a>
				<%	
					}
				%>
			<a class="btn btn-dark ml-auto" href="board_write.jsp" role="button">글쓰기</a>	
		</div>
		
		<div id="searchForm">
			<form>
				<select name="opt">
					<option value="0">전체</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
					<option value="4">글쓴이</option>
				</select>
				<input type="text" size="20" name="condition"/>&nbsp;
				<input type="submit" value="검색"/>
			</form>
		</div>
	</div>
	
	<div class="container">
			<div class="row">
				<div class="col-lg-4">
				
				</div>
				
				<div class="col-lg-3">
				
				</div>
				
				<div class="col-lg-5">
					
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