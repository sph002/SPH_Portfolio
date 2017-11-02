package work.model.dto;

/** 주문 요약 뷰 클래스 */
public class OrderSummary {
	
	/** 주문번호 */
	private int orderNo;
	
	/** 회원명 */
	private String memberId;
	
	/** 상품명 */
	private String productName;
	
	/** 주문수량 */
	private int productCount;
	
	/** 청구금액 */
	private int price;

	/** 기본생성자 */
	public OrderSummary() {}

	/** 전체 데이터 생성자 */
	public OrderSummary(int orderNo, String memberId, String productName, int productCount, int price) {
		this.orderNo = orderNo;
		this.memberId = memberId;
		this.productName = productName;
		this.productCount = productCount;
		this.price = price;
	}
	
	/** 상품명 수량 가격 생성자 */
	public OrderSummary(String productName, int productCount, int price) {
		this.productName = productName;
		this.productCount = productCount;
		this.price = price;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return orderNo + ", " + memberId + ", " + productName + ", " + productCount + ", " + price;
	}
	
}
