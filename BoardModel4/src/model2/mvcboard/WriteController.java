package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("./Write.jsp").forward(request, response);
	}


	//--------------------------------------파일 업로드---------------------------------------
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		int maxPostSize = 1024*1000; //기존에는 xml에 정의
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		//application은 jsp의 내장객체이기 때문에 여기서 application을 바로 쓸수 없다
		//그래서 request를 통해 application의 객체를 받아올 수 있다
		
		if(mr == null) {
			JSFunction.alertLocation(response, "첨부 파일이 제한 용량을 초과합니다", "write.do");
			return ;
		}
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));

		
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null ) {
			String ext = fileName.substring(fileName.lastIndexOf(".")); //확장자 추출(. 기준으로 파일명, 확장자 분리)
			//새로운 파일명 생성
			String now = new SimpleDateFormat("yyyMMdd_HmsS").format(new Date());
			String newFileName = now + ext; //겹칠일 없이 now로 생성

			//파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);//file.separator:경로를 구분하는 특수기호
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);

			dto.setOfile(fileName);
			dto.setSfile(newFileName); //--------------dto저장 역할끝
			
		
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto); //db에 값넣기
		dao.close();
		
		if(result == 1) {
			response.sendRedirect("list.do");
		}else {
			response.sendRedirect("write.do");
		}
	}

}
