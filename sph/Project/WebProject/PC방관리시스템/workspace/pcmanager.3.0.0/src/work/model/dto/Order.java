package work.model.dto;

import java.util.Date;

/** 주문 클래스 */
public class Order {
	
	/** 주문번호 */
	private int orderNo;
	
	/** 회원아이디 */
	private String memberId;
	
	/** 주문시각 */
	private Date orderTime;

	/** 기본생성자 */
	public Order() {}

	/** 필수 데이터 생성자
	 * @param orderNo
	 * @param memberId
	 */
	public Order(int orderNo, String memberId) {
		this.orderNo = orderNo;
		this.memberId = memberId;
	}

	/** 전체 데이터 생성자
	 * @param orderNo
	 * @param memberId
	 * @param orderTime
	 */
	public Order(int orderNo, String memberId, Date orderTime) {
		this.orderNo = orderNo;
		this.memberId = memberId;
		this.orderTime = orderTime;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	@Override
	public String toString() {
		return orderNo + ", " + memberId + ", " + orderTime;
	}
	
}
