package sale;

import java.io.*;
import java.util.*;

public class SaleDAO {
	File file=new File("c:/data/java/ex05/sale.txt");
	//매출삭제
	public void delete(int code) {
		try {
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			String lines="";
			while((line=reader.readLine())!=null) {
				String[] items=line.split(",");
				if (code!=Integer.parseInt(items[0])) {
					lines=lines + line + "\n";
				}
			}
			FileWriter writer=new FileWriter(file, false);
			writer.write(lines);
			writer.close();
		} catch (Exception e) {
			System.out.println("매출삭제:"+ e.toString());
		}
	}
	//매출조회
	public Sale read(int code) {//자바빈
		Sale sale=new Sale();
		try {
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			while((line=reader.readLine())!=null) {
				String[] items=line.split(",");
				if(code==Integer.parseInt(items[0])) {
					sale.setCode(code);
					sale.setName(items[1]);
					sale.setPrice(Integer.parseInt(items[2]));
					sale.setQnt(Integer.parseInt(items[3]));
				}
			}
		} catch (Exception e) {
			System.out.println("매출조회:" + e.toString());
		}
		return sale;
	}
	//매출등록
	public void insert(Sale sale) {
		try {
			FileWriter writer=new FileWriter(file, true);
			writer.write(String.format("%d,%s,%d,%d\n",
					sale.getCode(),sale.getName(),sale.getPrice(), sale.getQnt()));
			writer.close();
//			writer.write(sale.getCode()+ ","+sale.getCode()+","+sale.getPrice()+","+
//			sale.getQnt()+"\n");
		} catch (Exception e) {
			System.out.println("매출등록:" + e.toString());
		}
	}
	//매출목록
	public ArrayList<Sale> list(){
		 ArrayList<Sale> array=new ArrayList<Sale>();
		 try {
			 BufferedReader reader=new BufferedReader(new FileReader(file));
			 String line="";
			 while((line=reader.readLine())!=null) {
				 String[] items=line.split(",");// 콤마의 갯수만큼 배열의 방이 생김  
				 Sale sale=new Sale();
				 sale.setCode(Integer.parseInt(items[0]));
				 sale.setName(items[1]);
				 sale.setPrice(Integer.parseInt(items[2]));
				 sale.setQnt(Integer.parseInt(items[3]));
				 array.add(sale);
				 
			 }
		 }catch(Exception e) {
			 System.out.println("매출목록오류:" + e.toString());
		 }
		 return array;
	}
}
