<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.board.boardDAO"%>
<%@ page import="model1.board.boardDTO" %>
<%@ page import="utils.BoardPage" %>
<%
	//DAO를 생성해 DB에 연결
	boardDAO dao =new boardDAO(application);

	//사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount= dao.selectCount(param); //게시물 수 확인
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);
	
	int pageNum = 1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && ! pageTemp.equals("")){
	   pageNum = Integer.parseInt(pageTemp);	
	}
	
	int start = (pageNum - 1) * pageSize + 1;
	int end = (pageNum * pageSize);
	
	param.put("start", start);
	param.put("end", end);
	
	// 	List<boardDTO> boardLists =dao.selectList(param); //게시물 목록 받기
 	List<boardDTO> boardLists = dao.selectListPage(param);
	dao.close();  //DB 연결 닫기

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>목록 보기(List)- 현재 페이지 :<%= pageNum %> (전체 : <%= totalPage %>)
	</h2>

	<jsp:include page="./Common/Link.jsp" /> <!--공통링크-->
	<h2>목록 보기(List)</h2>
	<!--검색품 -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
		<select name="searchField">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchWord" />
		<input type="submit" value="검색하기" />
		</td>
	</tr>
	</table>
	</form>

	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
	<!-- 각 컬럼의 이름 -->
	<tr>
		<th width="10%">번호</th>
		<th width="50%">제목</th>
		<th width="15%">작성자</th>
		<th width="10%">조회수</th>
		<th width="15%">작성일</th>
	</tr>
<% 
if (boardLists.isEmpty()){
	//게시물 하나도 없을때
	%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다 ^^*
			</td>
		</tr>
		</table>
	<% 
	}
else{
	//게시물이 있을때
	int virtualNum =0; //화면상에서의 게시물번호
	int countNum = 0;
	for (boardDTO dto :boardLists)
	{
      //virtualNum =totalCount--; //전체 게시물 수에서 시작해 1씩 감소
		virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
	%>	
		<tr align="center">
			<td><%= virtualNum %></td> <!-- 게시물 번호 -->
			<td align="left"> <!-- 제목(+ 하이퍼링크) -->
				<a href="View.jsp?num=<%= dto.getNum() %>"><%=dto.getTitle() %>
				</a>
			</td>
			<td align="center"><%= dto.getId() %></td>
			<td align="center"><%= dto.getVisitcount() %></td>
			<td align="center"><%= dto.getPostdate() %></td>
		</tr>
<% 
	}
}
%>	
	</table>
	<!-- 목록 하단의 [글쓰기]버튼 -->
	<table border="1" width="90%">
		<tr align="center">
		<!-- 페이징 처리 -->
			<td>
				<!--[첫페이지][이전블럭][1 2 3 4 5][다음블럭][마지막페이지] -->
				<%=BoardPage.pagingStr(totalCount, pageSize,blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<!-- 글쓰기 버튼 -->
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기
				</button></td>
			</tr>
	</table>
</body>
</html>