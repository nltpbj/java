package sale;

public class Sale {//자바빈(VO)
	private int code;
	private String name;
	private int price;
	private int qnt;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQnt() {
		return qnt;
	}
	public void setQnt(int qnt) {
		this.qnt = qnt;
	}
	
	@Override
	public String toString() {
		return "Sale [상품코드=" + code + ", 상품명=" + name + ", 상품단가=" + price + ", 판매수량=" + qnt + "]";
	}
	
	

}
