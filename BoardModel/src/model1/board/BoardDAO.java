package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
   public BoardDAO(ServletContext application) {
      super(application);
   }
   public int selectCount(Map<String,Object>map) {
	   int totalCount = 0;
	   String query = "SELECT COUNT(*) FROM board";
	   
	   if(map.get("searchWord") !=null){
		   query += " where " + map.get("searchField")+"  "
			   +"like '%" + map.get("searchWord") + "%'";
	   }
	   try {
		   stmt = con.createStatement();
		   rs = stmt.executeQuery(query);
		   rs.next();
		   totalCount = rs.getInt(1);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return totalCount;
   }
   	public List<BoardDTO> selectList(Map<String,Object> map){
	   
	   List<BoardDTO> bbs = new ArrayList<BoardDTO>();
	   
	   String query = "select * from board";
	   if(map.get("searchWord") !=null){
		   query += " where " + map.get("searchField")+"  "
			   +"like '%" + map.get("searchWord") + "%'";
	   }
	   
	   query += " order by num desc";
	   
	   try {
		   stmt = con.createStatement();
		   rs = stmt.executeQuery(query);
		   while(rs.next()) {
			   BoardDTO dto = new BoardDTO();
			   dto.setNum(rs.getString("num"));
			   dto.setTitle(rs.getString("title"));
			   dto.setContent(rs.getString("content"));
			   dto.setPostdate(rs.getDate("postdate"));
			   dto.setId(rs.getString("id"));
			   dto.setVisitcount(rs.getString("visitcount"));
			   
			   bbs.add(dto);
			   
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return bbs;
   }
   	
   	public int insertWrite(BoardDTO dto) {
   		
   		int result =0;
   		String query = "insert into board (num,title,content,id,visitcount)"
   				+ " values(seq_board_num.nextval,?,?,?,0)";//seq_board_num=>오라클에 musthave에 시퀀스 이름확인
   		
   				
   		try {
   			psmt = con.prepareStatement(query);
   	   		psmt.setString(1, dto.getTitle());
	   	   	psmt.setString(2, dto.getContent());
	   	   	psmt.setString(3, dto.getId());
   	 
	   	   	result = psmt.executeUpdate();
   		}catch(Exception e) {
 		   e.printStackTrace();
   		}
   		return result;
   	}
   	public BoardDTO selectView(String num) {
   		String query = "select b.*, m.name"
   				+ " from member m inner join board b"   //쿼리문은 띄어쓰기 잘 해야 오류가 안난다.
   				+ " on m.id = b.id "
   				+ " where num = ?";
   		
   		BoardDTO dto = new BoardDTO();
   		
   		try {
   			psmt = con.prepareStatement(query);
   			psmt.setString(1, num);
   		
   			rs = psmt.executeQuery();
   			
   			if(rs.next()) {
   				dto.setNum(rs.getString(1));
   				dto.setTitle(rs.getString(2));
   				dto.setContent(rs.getString("content"));
   				dto.setPostdate(rs.getDate("postdate"));
   				dto.setId(rs.getString("id"));
   				dto.setVisitcount(rs.getString(6));
   				dto.setName(rs.getString("name"));
   			}
   		}catch(Exception e) {
 		   e.printStackTrace();
   		}
   		return dto;
   	}
   	public void updateVisitCount(String num) {
   		String query = "update board set"
   				+ " visitcount = visitcount + 1"
   				+ " where num = ?";
   		try {
   			psmt = con.prepareStatement(query);
   			psmt.setString(1, num);
   			psmt.executeUpdate();
   		}catch(Exception e) {
 		   e.printStackTrace();
   		}
   	}
   	
//지정한 게시물을 수정합니다. 코드
   	public int updateEdit(BoardDTO dto) {
   		int result = 0;
   		
   		try {
   			//쿼리문 템플릿
   			String query = "update board SET"
   						+ " title=?, content=? "
   						+ " where num= ?";
   			//쿼리문 완성
   			psmt = con.prepareStatement(query);
   			psmt.setString(1, dto.getTitle());
   			psmt.setString(2, dto.getContent());
   			psmt.setString(3, dto.getNum());
   		
   			result = psmt.executeUpdate();//쿼리문 실행
   		}catch(Exception e) {
  		   System.out.println("게시물 수정 중 예외 발생");
   			e.printStackTrace();
   		
   		}
   		return result;//결과반환
   	}
   	
   	public int deletePost(BoardDTO dto) {
   		int result = 0;
   		
   		String query = "delete from board where num = ?";
   		
   		try {			
   			//쿼리문 완성
   			psmt = con.prepareStatement(query);
   			psmt.setString(1, dto.getNum());//java.sql.SQLSyntaxErrorException: ORA-01722: 수치가 부적합합니다 쿼리문 오류
   			result = psmt.executeUpdate(); //쿼리문 실행
   		}catch(Exception e) {
   			e.printStackTrace();
   		}
   		return result;//결과반환
   	}
}