package work.model.dto;

import java.util.Date;

/** 사용내역 클래스 */
public class UseList {
	
	private String memberId ;
	private int seatNo;
	private int useTime;
	private int cost;
	private Date payTime;
	
	public UseList() {
		
	}
public UseList(String memberId, int seatNo, int useTime, int cost) {
		
		this.memberId = memberId;
		this.seatNo = seatNo;
		this.useTime = useTime;
		this.cost = cost;
	}
	public UseList(String memberId, int seatNo, int useTime, int cost, Date payTime) {
		
		this.memberId = memberId;
		this.seatNo = seatNo;
		this.useTime = useTime;
		this.cost = cost;
		this.payTime = payTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public int getUseTime() {
		return useTime;
	}

	public void setUseTime(int useTime) {
		this.useTime = useTime;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	@Override
	public String toString() {
		return memberId + ", " + seatNo + ", " + useTime + ", " + cost + ", " + payTime;
	}
}
