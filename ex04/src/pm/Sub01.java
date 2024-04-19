package pm;

import java.io.*;
import java.util.*;
import am.Car;  //am에 있는 Car 추가

public class Sub01 {
	public static void run() {
		File file=new File("c:/data/java/car.txt");
		try {//오류가 없으면 try 있으면 catch
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line="";
			StringTokenizer st=null;
			String[] items=new String[6];
			while((line=reader.readLine())!=null)       {    //reader.readLine 한줄씩 읽겠다는 뜻
		//		st=new StringTokenizer(line, ",");
				String no=st.nextToken();
				String company=st.nextToken();
				String model=st.nextToken();
				String color=st.nextToken();
				String distance=st.nextToken();
				String date=st.nextToken();
				items = line.split(",");
				Car car=new Car();
//				car.setNo(Integer.parseInt(items[0]));
//				car.setCompany(items[1]);
//				car.getColor(items[2]);
//				car.setCompany(items[3]);
//				car.setCompany(items[4]);
//				
				
				Car Car=new Car(Integer.parseInt(no), company, model, color, Integer.parseInt(distance), date);
				
				System.out.println("번호:"  + Car.getNo());
				System.out.println("회사:"  + Car.getCompany());
				System.out.println("색상:"  + Car.getColor());
				System.out.printf("주행거리:%,dkm\n", Car.getDistance() );
				System.out.println("년식:"  + Car.getDate());
				System.out.println("---------------------------------------");
				
			}	
		}catch(Exception e) {
			System.out.println("오류:" + e.toString());
		}
	
	
	}
}
