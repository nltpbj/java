package am;

import java.util.Scanner;

public class Sub01 {
	public static void run() {
		System.out.println("성적관리프로그램");
		boolean stop=false;
		Scanner scan=new Scanner(System.in);
		
		String[] names=new String[100];
		int[] kors=new int[100];
		int[] engs=new int[100];
		int[] mats=new int[100];
		names[0]="홍길동"; kors[0]=98; engs[0]=88; mats[0]=99;
		names[1]="심청이"; kors[1]=72; engs[1]=82; mats[1]=79;
		int count=2;
		
		while(!stop) {
			System.out.println("\n------------------------");
			System.out.println("1.성적등록|2.성적출력|0.종료");
			System.out.println("------------------------");
			System.out.print("선택>");
			String menu=scan.nextLine();
			switch(menu) {
			case "1":
				System.out.print("이름>");
				String name=scan.nextLine();
				System.out.print("귝어>");
				String kor=scan.nextLine();
				System.out.print("영어>");
				String eng=scan.nextLine();
				System.out.print("수학>");
				String mat=scan.nextLine();
				names[count]=name;
				kors[count]=Integer.parseInt(eng);
				mats[count]=Integer.parseInt(mat);
				engs[count]=Integer.parseInt(kor);
				System.out.println(name+ "학생이 등록되었습니다");
				count = count +1;
				break;
			case "2":
				String test="과목평균";
				int sum_kor=0; int sum_mat=0; int sum_eng=0;
				for(int i=0; i<count; i++) {
					int tot=kors[i]+engs[i]+mats[i];
					double avg= tot/3.;
					String grade="";
					if(avg>=90) {
						if(avg>=95) {
							grade = "A+";
						}else {
							grade = "A0";
						}
					}else if(avg>=80) {
						if(avg>=85) {
							grade="B+";
						}else {
							grade ="B0";
						}
					}else if(avg>=70) {
						if(avg>=75) {
							grade="C+";
					}else {
						grade ="C0";}
					}else if(avg>=60) {
						if(avg>=65) {
							grade="D+";
					}else {
						grade ="D0";}
					}else {
						grade="F0";
					}
					
					System.out.printf("%s\t%d\t%d\t%d\t%d\t%.2f\t%s\n",names[i],kors[i],engs[i],mats[i], tot, avg, grade);
					sum_kor=sum_kor+kors[i]; sum_eng=sum_eng+engs[i]; sum_mat=sum_mat+mats[i];
				}
				System.out.println("----------------------------------------------");
				System.out.printf("%s\t%.2f\t%.2f\t%.2f\n",	test,			
				sum_kor/(float)count, sum_eng/(float)count, sum_mat/(float)count);
				System.out.println("-----------------------------------------------");
				System.out.println(count + "명 학생이 존재합니다.");
				break;
			case "0":
				stop=true;    
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("0~2번 메뉴를 선택하세요!");
			}
		}
		
		
		
		
		
		
		
		
	}
}
