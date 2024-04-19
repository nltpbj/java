package ex01;

import java.util.Scanner;

public class Sub10 {
	public static void run() {
		boolean run=true;
		Scanner scan=new Scanner(System.in);
		String[] names=new String[100];
		int[] prices= new int[100];
		int[] qnt=new int[100];
		int count=0;
		
		while(true) {
			System.out.println("\n\n------------------------");
			System.out.println("1.매출등록|2.매출현황|0.종료");
			System.out.println("------------------------");
			System.out.print("선택>");
			String menu=scan.nextLine();
			switch(menu) {
			case "1":
				System.out.print("이름>");
				String name=scan.nextLine();		
				names[count]=name;
				System.out.print("단가>");
				int price=Integer.parseInt(scan.nextLine());
				prices[count]=price;
				System.out.print("수량>");
				int qn=Integer.parseInt(scan.nextLine());
				qnt[count]=qn;
				System.out.println("등록완료!");
				count++;
				break;
			case"2":
				if(count<1) {
					System.out.println("등록된 상품이 없습니다.");
				}else {
					for(int i=0; i<count; i++) {
						int sum=prices[i]*qnt[i];
						System.out.printf("%s\t%d만원\t%d개\t%d만원\n",names[i],prices[i],qnt[i],sum);
						System.out.println("----------------------------------------");
					}
				}
				break;
			case"0":
				run=false;
				System.out.println("프로그램을 종료합니다.");
				break;
				default:
				System.out.println("0~2메뉴를 선택하시오.");
			}
		}
		
		
		
		
		
		
	}
}
