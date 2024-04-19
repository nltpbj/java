package am;

import java.util.*;

public class Sub01 {
	  
	public static void run() {
		      boolean run=true;
		      ArrayList<Car> cars=new ArrayList<>();
		      Scanner scan=new Scanner(System.in);
		      
		      Car car=new Car(1,"현대", "그랜저", "검정",20000,"2023-04");
		      cars.add(car);
		      car=new Car(2,"쌍용", "티볼리", "파랑",60000,"2021-02");
		      cars.add(car);
		      car=new Car(3,"기아", "k7", "흰색",80000,"2019-02");
		      cars.add(car);
		      
		      while(run) {
		         System.out.println("--------------------------------------------");
		         System.out.println("1.차량등록|2.차량조회|3.차량목록|4.차량삭제|0.종료");
		         System.out.println("--------------------------------------------");
		         System.out.print("선택>");
		         String menu=scan.nextLine();
		         switch(menu) {
		         case "1":
		            break;
		         case "2":
		        	 while(true) {
		        		 System.out.print("조회할 차종:");
		        		 String cmodel=scan.nextLine();
		        		 if(cmodel=="") break;
		        		 boolean find=false;
		        		 for(Car c:cars) {
		        			 if(cmodel.equals(c.getModel())) {
		        				System.out.println("코드::" + c.getNo());
								System.out.println("회사:" + c.getCompany());
									find=true;
		        			 }
		        		 }	 
		        			 if(!find) System.out.println(cmodel + "데이터가 존재하지 않습니다");
		        			 
		        		 
		        	 } 
		            break;
		         case "3":
		        	 for(Car c:cars) {
		        		 System.out.printf("%d\t%s\t%s\t%s\t%d\t%s\n"
		        			,c.getNo(), c.getCompany(), c.getModel(),c.getColor(), c.getDistance(), c.getDate() );
		        	 }
		        	 System.out.println("등록된 차량"+ cars.size());
		            break;
		         case "4":
		            break;
		         case "0":
		            System.out.println("프로그램을 종료합니다.");
		            run=false;
		            break;
		         default:
		            System.out.println("0~4메뉴를 선택하세요!");
		         }//switch
		      }//while
		   }//run
}