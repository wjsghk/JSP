package model1.board;

import lombok.Getter;
import lombok.Setter;
//임포트문 자동추가 ctrl+shift+o(알파벳)
@Getter
@Setter
public class BoardDTO {
   // 멤버 변수 선언
   private String num;
   private String title;
   private String content;
   private String id;
   private java.sql.Date postdate;
   private String visitcount;
   private String name;
}