package am;

import java.util.*;

public class Sub01 {
	public static void run() {
		boolean run=true;
		Scanner scan = new Scanner(System.in);
		ArrayList<String> names=new ArrayList<String>();
		ArrayList<Integer> kors=new ArrayList<>();
		ArrayList<Integer> engs=new ArrayList<>();
		ArrayList<Integer> mats=new ArrayList<>();
		names.add("홍길동"); kors.add(80); mats.add(82); engs.add(77);
		names.add("강감찬"); kors.add(84); mats.add(94); engs.add(62);
		
		while(run) {
			System.out.println("\n\n---------------------------------------");
			System.out.println("1.성적등록|2.성적목록|3.성적조회|4.성적삭제|0.종료");
			System.out.println("---------------------------------------");
			System.out.print("선택>");
			String menu=scan.nextLine();
			switch(menu) {
			case "0":
				run=false;
				break;
			case "1":
				System.out.print("이름>");
				names.add(scan.nextLine());
				System.out.print("국어>");
				kors.add(Integer.parseInt(scan.nextLine()));
				System.out.print("영어>");
				engs.add(Integer.parseInt(scan.nextLine()));
				System.out.print("수학>");
				mats.add(Integer.parseInt(scan.nextLine()));
				System.out.println("등록완료");
				break;
			case "2":
				int sum_kor=0;
				int sum_mat=0;
				int sum_eng=0;
				for(int i=0; i<names.size(); i++) {
					int tot=kors.get(i)+engs.get(i)+mats.get(i);
					double avg=tot/3.;
					System.out.printf("%s\t%d\t%d\t%d\t%d\t%.2f\n", names.get(i),kors.get(i),engs.get(i),mats.get(i),tot,avg);
					sum_kor=sum_kor+kors.get(i);
					sum_mat=sum_mat+mats.get(i);
					sum_eng=sum_eng+engs.get(i);
				}
				System.out.println("---------------------------------------");
				System.out.printf("과목평균:\t%.2f\t%.2f\t%.2f\n", 
						sum_kor/(double)names.size(),sum_eng/(double)names.size(),sum_mat/(double)names.size());
				System.out.println("---------------------------------------");
				System.out.println(names.size() + "명의 성적이 존재합니다.");
				break;
			case "3":
				System.out.print("조회할 이름>");
				String sname=scan.nextLine();
				boolean find=false;
				for(int i=0;i<names.size();i++) {
					if(names.get(i).equals(sname)){
						System.out.println("국어:"+ kors.get(i));
						System.out.println("영어:"+ engs.get(i));
						System.out.println("수학:"+ mats.get(i));
						int tot=kors.get(i)+engs.get(i)+mats.get(i);
						System.out.println("총점:"+ tot);
						System.out.printf("평균:%.2f\n", tot/3.);
						find=true;
					}
				}
				if(!find) System.out.println(sname +"학생이 존재하지 않습니다.");
				
				break;
			case "4":
				System.out.print("삭제할이름:");
				String rname=scan.nextLine();
				find=false;
				for(int i=0;i<names.size();i++) {
					if(names.get(i).equals(rname)) {
						System.out.println("국어:" + kors.get(i));
						System.out.println("영어:" + engs.get(i));
						System.out.println("수학:" + mats.get(i));
						int tot=kors.get(i)+engs.get(i)+mats.get(i);
						System.out.println("총점:" + tot);
						System.out.printf("평균:%.2f\n", tot/3.);
						find=true;
						System.out.print("삭제하실래요(네/아니요)?");
						String ans=scan.nextLine();
						if(ans.equals("네") || ans.equals("Y")) {
							names.remove(i);
							kors.remove(i);
							engs.remove(i);
							mats.remove(i);
							System.out.println("삭제완료");
						}else {
							System.out.println("삭제취소");
						}
					}
				}
				if(!find) System.out.println(rname + "학생이 존재하지 않습니다.");
				break;
			default:
				System.out.println("0~4번 메뉴를 선택하세요!");
			}//switch
			
		}//while
		System.out.println("프로그램을 종료합니다.");
	}

}
