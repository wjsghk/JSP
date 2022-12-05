package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class boardDAO extends JDBConnect{
	public boardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM board";
		
		if(map.get("searchWord") !=null) {
			query += " where " + map.get("searchField") + "  "
					+"like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();  //쿼리문 생성
			rs = stmt.executeQuery(query); //쿼리문 실행
			rs.next();				//커서를 첫번째 행으로 이동
			totalCount =rs.getInt(1);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<boardDTO> selectList(Map<String, Object> map){
		
		List<boardDTO> bbs = new ArrayList<boardDTO>();
		
		String query = "select * from board";
		
		if(map.get("searchWord") !=null) {
			query += " where " + map.get("searchField") + "  "
					+"like '%" + map.get("searchWord") + "%'";
		}
		
		query += " order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				boardDTO dto = new boardDTO();
				
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
	
	public List<boardDTO> selectListPage(Map<String, Object> map){
		
		List<boardDTO> bbs = new ArrayList<boardDTO>();
		
		String query = "select *"
				+ " from ("
				+ " select rownum rNUM, tb.* "
				+ " from ( "
				+ " select * "
				+ " from board ";
		
				if(map.get("searchWord") !=null) {
					query += " where " + map.get("searchField") + "  "
							+" like '%" + map.get("searchWord") + "%'";
				}
				
				query += " order by num desc "
				+ " ) tb"
				+ " ) "
				+ " where rNum between ? and ?";
				
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, map.get("start").toString());
					psmt.setString(2, map.get("end").toString());
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						boardDTO dto = new boardDTO();
						
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
	
		public int insertWrite(boardDTO dto) {
		
		int result = 0;
		String query = "insert into board (num,title,content,id,visitcount)"
				+ " values(seq_board_num.nextval,?,?,?,0)";
		
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
	
		public boardDTO selectView(String num)	{  //쿼리문 바로작성하지말고 찍어보고옮기기
		
		String query = "select b.*, m.name"
				+ " from member m inner join board b"
				+ " on m.id = b.id"
				+ " where num = ?";
		
		boardDTO dto = new boardDTO();
		
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
	public int updateEdit(boardDTO dto) {
		int result =0;
		try {
			String query = "UPDATE board SET"
						 + " title=?, content=? "
						 + " WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			//쿼리문 실행
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();	
		}
		return result; //결과 반환
	}
	
	public int deletePost(boardDTO dto) {
		
		int result = 0;
		
		String query = "delete from board where num = ?";
		
		try {	
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getNum());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();	
		}
		
		return result;
	}
}