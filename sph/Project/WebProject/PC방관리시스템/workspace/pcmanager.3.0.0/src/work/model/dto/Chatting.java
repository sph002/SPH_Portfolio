package work.model.dto;

import java.util.Date;

/** 채팅 클래스 */
public class Chatting {
	
	/** 채팅번호 */
	private int chatNo;
	
	/** 관리자 */
	private String admin;
	
	/** 회원아이디 */
	private String memberId;
	
	/** 시작시각 */
	private Date startTime;
	
	/** 내용 */
	private String content;
	
	public Chatting() {}
	
	public Chatting(int chatNo, String admin, String memberId) {
		this.chatNo = chatNo;
		this.admin = admin;
		this.memberId = memberId;
	}
	
	public Chatting(int chatNo, String admin, String memberId, Date startTime, String content) {
		this.chatNo = chatNo;
		this.admin = admin;
		this.memberId = memberId;
		this.startTime = startTime;
		this.content = content;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return chatNo + ", " + admin + ", " + memberId + ", " + startTime + ", " + content;
	}

}
