package membership;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String regidate;
}
