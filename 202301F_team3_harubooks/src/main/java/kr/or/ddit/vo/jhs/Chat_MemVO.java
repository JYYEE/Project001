package kr.or.ddit.vo.jhs;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Chat_MemVO {
	private String cr_no;
	private String ae_id;
	private String cn_cntn_yn;
	private String cm_master_yn;
	private String cm_join_ymd;
	private String cm_out_yn;
	
	private String mem_profile;
	private String mem_nicknm;
	
	private String chat_no;
	private String chat_message;
	private String chat_type;
	private String chat_to;
	private String chat_current_time;
}
