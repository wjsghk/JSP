package model1.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class boardDTO {
	// 멤버 변수 선언
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	private String name;
}
