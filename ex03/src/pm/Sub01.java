package pm;

import java.util.*;

public class Sub01 {
	static void run() {//  private는 이 클래스 안에서만 쓰겠다는 선언
		boolean run=true;
		Scanner scan=new Scanner(System.in);
		ArrayList<Sale> sales=new ArrayList<>();
		Sale s1=new Sale();
		s1.code="100";
		s1.name="냉장고";
		s1.price=350;
		s1.qnt=15;
		sales.add(s1);
		Sale s2=new Sale("101", "세탁기", 270, 25);
		sales.add(s2); 
		
		while(run) {
			System.out.println("\n\n---------------------------------------");
			System.out.println("1.매출등록|2.매출목록|3.매출조회|4.매출삭제|0.종료");
			System.out.println("---------------------------------------");
			System.out.print("선택>");
			String menu=scan.nextLine();
			switch(menu) {
			case"1":
				Sale s3=new Sale();
				Sale last=sales.get(sales.size()-1);
				int code=Integer.parseInt(last.code)+1;// string->int
				s3.code=String.valueOf(code);// int-> string
				System.out.println("상품코드>"+ s3.code);
				s3.code=scan.nextLine();
				System.out.print("상품이름>");
				s3.name=scan.nextLine();
				if(s3.name=="")break;
				while(true) {
					System.out.print("상품가격>");
					String price=scan.nextLine();
					if(price=="")break;
					if(checkNumber(price)) {
						s3.price=Integer.parseInt(price);
						break;
					}
					
				}
				while(true){
				
				System.out.print("상품수량>");
				String qnt=scan.nextLine();
				if(checkNumber(qnt)) {
					s3.qnt=Integer.parseInt(qnt);
					break;
					}
				}
				
				sales.add(s3);
				System.out.println("상품등록완료!");
			
				break;
			case"2"://매출목록
				int tsum=0;
				int tqnt=0;
				for(Sale s:sales) {
					s.print_land();
					
					 tsum=tsum+s.sum(); 
					 tqnt=tqnt+s.qnt;
				}
				System.out.println("----------------------------------");
				System.out.printf("\t총수량:%d개\t총판매액:%d,만원\n",tqnt ,tsum);
				System.out.println(sales.size() + "개의 상품이 존재합니다.");
				
				break;
			case"3"://상품조회
				while(true) {
					
				System.out.print("조회할상품명>");
				String sname=scan.nextLine();
				if(sname=="") break;
				boolean find = false;
				for(Sale s:sales) {
					if(s.name.equals(sname)) {
						s.print_port();
						find=true;
					}
				}
				if(!find) System.out.println(sname + "상품이 존재하지 않습니다");
				}//wh
				break;
			case"4"://매출삭제
				System.out.print("삭제할상품명/코드>");
				String sname=scan.nextLine();
				if(sname=="") break;
				boolean find = false;
				for(Sale s:sales) {
					if(s.name.equals(sname) || s.code.equals(sname)) {
						find=true;
						s.print_port();
						System.out.println("삭제하실래요(y/Y)");
						String ans=scan.nextLine();
						if(ans.equals("Y") || ans.equals("y")) {
							sales.remove(s);
							System.out.println("삭제완료");
							break;
						}else {
							System.out.println("삭제취소");
						}
						break;
					}
				}
				if(!find) System.out.println(sname + "상품이 존재하지 않습니다");
				break;
			case"0":
				run=false;
				break;
			default:
				System.out.println("0~4번 메뉴를 선택하시요!");
				
			}//sw
		}//wh
		System.out.println("프로그램을 종료합니다");
	}//me
	//숫자인지 아닌지 판별하는 메서드
	public static boolean checkNumber(String str) {
		try {
			int num=Integer.parseInt(str);
			return true;
		}catch(Exception e) {
			System.out.println("숫자로 입력하세요!");
			return false;
		}
	}
}//cl
	