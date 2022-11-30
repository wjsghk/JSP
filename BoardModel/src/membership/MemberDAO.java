package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {

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
			//쿼리실행
			psmt = con.prepareStatement(query);//동적 쿼리문 준비
			psmt.setString(1, uid);//쿼리문의 첫 번쨰 인파라미터에 값 설정
			psmt.setString(2, upass);//쿼리문의 두 번쨰 인파라미터에 값 설정
			rs = psmt.executeQuery();//쿼리문 실행
			
			//결과처리
			if(rs.next()) {//쿼리결과로 얻은 회원 정보를 DTO객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		}catch(Exception e) {
		e.printStackTrace();	
		}
		return dto;//DTO객체 반환
		
		
	
	}
}
