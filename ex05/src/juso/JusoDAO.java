package juso;

import java.util.*;
import java.io.*;

public class JusoDAO {//DAO:Data Access Object
	File file=new File("c:/data/java/ex05/juso.txt");
	//주소삭제
	public void delete(int no) {
		try {
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			String lines="";
			while((line=reader.readLine()) !=null) {
				String[] items=line.split(",");
				if(no!=Integer.parseInt(items[0])) {
					//System.out.println(line);
					lines=lines+line+"\n";
				}
			}
			FileWriter writer = new FileWriter(file, false);
			writer.write(lines);
			writer.close();
		}catch(Exception e) {
			System.out.println("주소삭제:" + e.toString());
		}
	}
	//주소조회
	public void insert(Juso juso) {
		try {
			FileWriter Writer=new FileWriter(file, true);//true로 주면 기존데이터에 추가 false는 기존데이터를 삭제하고 추가
			Writer.write(juso.getNo()+","+juso.getName()+","+juso.getPhone()+","+juso.getAddress()+"\n");
			Writer.close();
		}catch(Exception e) {
			System.out.println("주소등록:" + e.toString());
		}
	}
	//이름 조회
	public Juso read(String name) {
		Juso juso=new Juso();
		try {
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			while((line=reader.readLine()) !=null ) {
				String[] items=line.split(",");
				if(items[1].equals(name) || items[0].equals(name)) {
				juso.setNo(Integer.parseInt(items[0]));
				juso.setName(items[1]);
				juso.setPhone(items[2]);
				juso.setAddress(items[3]);
				}
			}
		}catch(Exception e) {
			System.out.println("이름조회:" + e.toString());
		}
		return juso;
	}
	//주소목록
	public ArrayList<Juso> list(){
		ArrayList<Juso> array=new ArrayList<Juso>();
		try {
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			while((line=reader.readLine()) !=null ) {
				String[] items=line.split(",");// 텍스트안에 들어가서 나눠주는게 |라는 뜻
				Juso juso=new Juso();
				juso.setNo(Integer.parseInt(items[0]));
				juso.setName((items[1]));
				juso.setPhone((items[2]));
				juso.setAddress((items[3]));
				
				array.add(juso);
			}
		}catch(Exception e) {
			System.out.println("주소목록:"+ e.toString());
		}
		
		return array;
	}
}
