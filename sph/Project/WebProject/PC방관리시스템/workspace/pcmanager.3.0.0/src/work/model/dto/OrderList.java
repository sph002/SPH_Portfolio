package work.model.dto;

/** 주문내역 클래스 */
public class OrderList {
	
	/** 주문번호 */
	private int orderNO;
	
	/** 상품명 */
	private String  productName;
	
	/** 주문수량 */
	private int  productCount;

	/** 기본생성자 */
	public OrderList() {}
	
	/** 상품명, 주문 수량 생성자 */
	public OrderList(String productName, int productCount) {
		this.productName = productName;
		this.productCount = productCount;
	}

	/** 전체 데이터 생성자
	 * @param orderNO
	 * @param productName
	 * @param productCount
	 */
	public OrderList(int orderNO, String productName, int productCount) {
		this.orderNO = orderNO;
		this.productName = productName;
		this.productCount = productCount;
	}

	public int getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
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

	@Override
	public String toString() {
		return orderNO + ", " + productName + ", " + productCount;
	}
	
}
