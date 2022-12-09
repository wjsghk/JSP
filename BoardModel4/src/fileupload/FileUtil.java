package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	//파일 업로드(multipart/form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest request,
			String saveDirectory, int maxPostSize) {
		try {
			//파일 업로드
			return new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8");
		}
		catch (Exception e){
			//업로드 실패
			e.printStackTrace();
			return null;
		}
	}
	//명시한 파일을 찾아 다운로드한다.
	public static void download(HttpServletRequest req, HttpServletResponse resp, 
				String directory, String sfileName, String ofileName) { 
		
		String sDirectory = req.getServletContext().getRealPath(directory); //서블릿에서 디렉터리의 물리적경로를얻어온다.
		try{
			
			// 파일을 찾아 입력 스트림 생성
			File file = new File(sDirectory, sfileName);
			InputStream inStream = new FileInputStream(file);
		
			//한글 파일명 깨짐 방지
			String client = req.getHeader("User-Agent"); //User-Agent를통해 클라이언트의 웹브라우저 종류를 알아온다
			if (client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("UTF-8"),"ISO-8859-1");
			}
			else{
				ofileName= new String(ofileName.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			//파일 다운로드용 응답 헤더 설정
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition","attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());
			
			//출력 스트림 초기화
			//out.clear();
			
			//repsponse 내장 객체로 부터 새로운 출력 스트림 생성
			OutputStream outStream = resp.getOutputStream();
			
			//출력 스트림에 파일 내용 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while ( (readBuffer = inStream.read(b)) > 0 ){
				outStream.write(b, 0 ,readBuffer);
			}
			
			//입출력 스트림 닫음
			inStream.close();
			outStream.close();
		}
		
		catch (FileNotFoundException e){
			System.out.println("파일을 찾을 수없습니다.");
			e.printStackTrace();
		}
		catch (Exception e){
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}
	
	//지정한 위치의 파일을 삭제해요
	public static void deleteFile(HttpServletRequest req,String directory,String filename) {
		
		String sDirectory = req.getServletContext().getRealPath(directory); //파일이 저장된 디렉터리의 물리적 경로를 얻어옴
		File file = new File(sDirectory + File.separator + filename); //경로와 파일명을 결합하여 파일 객체생성
		if(file.exists()) {
			file.delete();
		}
	}
}
