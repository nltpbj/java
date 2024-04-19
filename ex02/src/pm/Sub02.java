package pm;

import java.util.*;

public class Sub02 {
	public static void run() {
		ArrayList<Integer> nums=new ArrayList<>();
		Scanner scan=new Scanner(System.in);
		
		while(true) {
			System.out.print("수입력:");
			String num=scan.nextLine();
			if(num=="") {
				System.out.println("입력을 종료합니다");
				break;
			}else {
				nums.add(Integer.parseInt(num));
			}
		}//wh
		
		//데이터갯수, 수합계, 수평균
		System.out.println("----------------------------");
		System.out.printf("데이터갯수:%d\n", nums.size());
		int sum=0;
		for(int i=0;i<nums.size(); i++) {//데이터 전체출력
			sum=sum+nums.get(i);
		}
		System.out.printf("수합계:%d\n", sum);
		System.out.printf("수평균:%.2f\n", sum/(float)nums.size());
		
	}
}
