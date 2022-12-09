package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.MVCBoardPage;


@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DAO 생성
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//뷰에 전달할 매개변수 저장용 맵 생성
		Map<String,Object> map = new HashMap<String,Object>();
		
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		if(searchWord != null) {
			//쿼리스트링으로 전달받은매개변수 중 검색어가 있다면 map에 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);  //게시물 개수
		
		//페이지처리
		ServletContext application= getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		//현재 페이지 확인
		int pageNum = 1; //기본값
		String pageTemp = request.getParameter("pageNum");
		if (pageTemp != null  && !pageTemp.equals("")) { 
				pageNum = Integer.parseInt(pageTemp); //요청받은 페이지로 수정
		}
		
		//목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1; //첫 게시물 번호
		int end = pageNum * pageSize; //마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		//페이지 처리끝
		
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		//게시물 목록 받기
		dao.close(); //DB 연결 닫기
		
		//뷰에 전달할 매개변수 추가
		String pagingImg = MVCBoardPage.pagingStr(totalCount, pageSize,blockPage, pageNum, "./list.do");
		//바로가기 영역 HTML 문자열
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		//전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("./List.jsp").forward(request, response);
	}

}
