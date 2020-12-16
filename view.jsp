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
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board_home.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
		
	     BoardDAO dao = new BoardDAO();
	     dao.count(boardID);
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=board.getBoardTITLE().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2"><%= board.getBoardDATE().substring(0, 11) + board.getBoardDATE().substring(11, 13) + "시 " + board.getBoardDATE().substring(14, 16) + "분" %></td>

					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardCONTENT().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			
			<a href="board_home.jsp" class="btn btn-dark mr-1">목록</a>
			<%
				if(userID != null && userID.equals(board.getUserID())) {
			%>
					<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-dark mr-1">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-dark mr-1">삭제</a>
			<%
				}
			%>
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