package product;

import java.util.ArrayList;
import java.sql.*;

public class ProductDAO implements ProductInter{
	Connection con=Database.CON;
	
	@Override
	public ArrayList<ProductVO> list() {
		ArrayList<ProductVO> array=new ArrayList<>();
		try {
			String sql="select * from product";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ProductVO vo=new ProductVO();
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				array.add(vo);
				
			}
		} catch (Exception e) {
			System.out.println("상품목록:"+e.toString());
		}
		return 	array;
	}

	@Override
	public void insert(ProductVO vo) {
		try {
			String sql="insert into product(code, name, price) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, vo.getCode());
			ps.setString(2, vo.getName());
			ps.setInt(3, vo.getPrice());
			ps.execute();

		} catch (Exception e) {
			System.out.println("상품등록:"+e.toString());
		}
		
	}

	@Override
	public boolean delete(String code) {
		try {
			String sql="delete from product where code=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, code);
			ps.execute();
			return true;
		} catch (Exception e) {
			
			return false;
		}
		
	}

	@Override
	public void update(ProductVO vo) {
		try {
			String sql="update product set name=?, price=? where code=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(3, vo.getCode());
			ps.setString(1, vo.getName());
			ps.setInt(2, vo.getPrice());
			ps.execute();

		} catch (Exception e) {
			System.out.println("상품등록:"+e.toString());
		}
		
	}

	@Override
	public ProductVO read(String code) {
		ProductVO vo=new ProductVO();
		try {
			String sql="select * from product where code=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, code);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				vo.setCode(rs.getString("code"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
		
			}
			
		} catch (Exception e) {
			System.out.println("상품조회:" + e.toString());
		}
		return vo;
	}

	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select max(code)+1 as code from product";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) code=rs.getString("code");
		}catch(Exception e) {
			System.out.println("새로운코드:" + e.toString());
		}
		return code;
	}
	
}
