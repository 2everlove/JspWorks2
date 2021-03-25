package dto;

import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = 1234567L;
	
	private String productId; //상품 아이디
	private	String pname; //상품명
	private Integer uniPrice; //상품 가격
	private String description; //상품 설명
	private String manufacturer; //제조사
	private String category; //분류
	private long unitInStock; //재고 수
	private String condition; //신상,중고, 재고
	private String filename;

	public Product() {
		super();
	}//기본 생성자
	
	public Product(String productId, String pname, Integer uniPrice) {
		this.productId = productId;
		this.pname = pname;
		this.uniPrice = uniPrice;
	}
	
	
	//get(), set()
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUniPrice() {
		return uniPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.uniPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}//class
