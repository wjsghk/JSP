package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.one")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FrontController() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/regist.one")) 
			registFunc(request);
		else if (commandStr.equals("/login.one")) 
			loginFunc(request);
		else if(commandStr.equals("/freeboard.one")) 
			freeboardFunc(request);
		
		
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		request.getRequestDispatcher("/FrontController.jsp").forward(request, response);
		}
	
		void registFunc(HttpServletRequest request) {
			request.setAttribute("resultValue", "<h1>회원가입</h1>");
		}
		void loginFunc(HttpServletRequest request) {
			request.setAttribute("resultValue", "<h1>로그인</h1>");
		}
		void freeboardFunc(HttpServletRequest request) {
			request.setAttribute("resultValue", "<h1>자유게시판</h1>");
		}
	
	
	}


