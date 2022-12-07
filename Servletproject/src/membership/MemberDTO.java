package membership;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDTO {
	//멤버변수 선언
	private String id;
	private String pass;
	private String name;
	private String regidate;
}
