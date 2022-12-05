package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{

	public MemberDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}
	
	public MemberDTO getMemberDTO(String uid,String upass) {
		
		//1. 조회한 데이터를 담을 객체 생성
		MemberDTO dto = new MemberDTO();
		
		//2. 쿼리문 구성
		String query = "select * from member where id = ? and pass = ?";
		
		//3.쿼리문 실행
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,  uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
