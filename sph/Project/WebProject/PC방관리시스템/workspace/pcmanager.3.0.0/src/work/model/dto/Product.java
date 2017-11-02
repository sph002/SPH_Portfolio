package work.model.dto;

/** 상품 클래스 */
public class Product {
	
	/** 상품명 */
	private String productName;
	
	/** 재고 */
	private int stock;
	
	/** 구입가격 */
	private int priceBuy;
	
	/** 판매가격 */
	private int priceSell;
	
	/** 구분  */
	private String category; // 분류

	/** 기본생성자 */
	public Product() {}

	/**
	 * 필수 입력 데이터 생성자
	 * @param productName
	 */
	public Product(String productName) {
		this.productName = productName;
	}

	/**
	 * 전체 데이터 생성자
	 * @param productName
	 * @param stock
	 * @param priceBuy
	 * @param priceSell
	 * @param category
	 */
	public Product(String productName, int stock, int priceBuy, int priceSell, String category) {
		this.productName = productName;
		this.stock = stock;
		this.priceBuy = priceBuy;
		this.priceSell = priceSell;
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPriceBuy() {
		return priceBuy;
	}

	public void setPriceBuy(int priceBuy) {
		this.priceBuy = priceBuy;
	}

	public int getPriceSell() {
		return priceSell;
	}

	public void setPriceSell(int priceSell) {
		this.priceSell = priceSell;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return productName + ", " + stock + ", " + priceBuy + ", " + priceSell + ", " + category;
	}
	
}
