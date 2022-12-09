package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;


@WebServlet("/download.do")
public class DownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DownloadController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매개변수 받기
		String ofile = request.getParameter("ofile"); //원본 파일명
		String sfile = request.getParameter("sfile"); //저장된 파일명
		int idx = Integer.parseInt(request.getParameter("idx"));	 //다운로드 횟수때문에 가져옴
		
		//파일다운로드
		FileUtil.download(request, response, "/Uploads", sfile, ofile);
		
		//해당 게시물의 다운로드 수 1증가
		MVCBoardDAO dao = new MVCBoardDAO();
		dao.downCountPlus(idx);
		dao.close();
	}

	
	

}
