package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewController() {
        super();
       
    }

	//service메소드 요청마다 호출되어짐
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물 불러오기
		MVCBoardDAO dao = new MVCBoardDAO(); 
		String idx = request.getParameter("idx"); //게시물의 일련번호를 매개변수로 받는다
		dao.updateVisitCount(idx); //조회수 1증가
		MVCBoardDTO dto = dao.selectView(idx); //게시물 내용을 가져온다.
		dao.close();
		
		//줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n",  "<br/>"));

		//게시물(dto) 저장 후 뷰로 포워드
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./View.jsp").forward(request, response);
	}

	

}
