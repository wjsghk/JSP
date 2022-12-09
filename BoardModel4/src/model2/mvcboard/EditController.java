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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;


@WebServlet("/edit.do")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./Edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파일의 물리적인 경로
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
		//2. 파일의 용량
		int maxPostSize = 1024 * 1000;
		
		//3. MultipartRequest를 이용한 파일업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		//4.파일 업로드 실행 유무
		if(mr == null) {
			JSFunction.alertBack(response, "첨부 파일이 제한 용량을 초과했어요");
			return;
		}
		
		//5. 입력정보인 파라메터 받기
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
				
		HttpSession session = request.getSession();
		String pass =(String)session.getAttribute("pass");
		
		//6. DTO저장하기
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		//7. 파일 변경 유무 확인
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
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
			
			FileUtil.deleteFile(request, "Uploads", prevSfile);
		}else {
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result == 1) {
			session.removeAttribute("pass");
			response.sendRedirect("view.do?idx=" + idx);
		}else {
			JSFunction.alertLocation(response, "비밀번호 검증을 다시 진행해주세요.", "view.do?idx=" + idx);
		}
		
	}
	

}
