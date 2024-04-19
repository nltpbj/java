package sale;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import product.ProductVO;

public class SaleVO extends ProductVO{//자바빈 extends ProductVO:상속받기
	private int seq;
	private String code;
	private String sale_date; 
	private int qnt;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSale_date() {
		return sale_date;
	}
	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}
	public int getQnt() {
		return qnt;
	}
	public void setQnt(int qnt) {
		this.qnt = qnt;
	}
	
	@Override
	public String toString() {//inherited에서 price name 가져옴
		DecimalFormat df=new DecimalFormat("#,###");
		String fmtPrice=df.format(getPrice());
		SimpleDateFormat sdf=new SimpleDateFormat("yyy년MM월dd일");
		String fmtDate=sdf.format(sale_date);
		int sum=getPrice() * qnt;
		String fmtSum = df.format(sum);
		return "상품코드=" + code + ", 판매일=" + getSale_date() + ", 판매수량=" + qnt + ", 상품이름="
				+ getName() + ", 상품가격=" + fmtPrice +", 상품총금액=" + fmtSum;
	}

		
}
