package product;
import java.util.*;

public interface ProductInter {
	public ArrayList<ProductVO> list();
	public void insert(ProductVO vo);
	public boolean delete(String code);//primary 키를 code에서 받아와서 삭제
	public void update(ProductVO vo);
	public ProductVO read(String code);
	public String getCode();
	
	
}
