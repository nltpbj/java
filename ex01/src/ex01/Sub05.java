package ex01;

public class Sub05 {
	public static void run() {
		//제어문 (if, switch)
		int score=97;
		String grade="";
		
		if(score>=90) {
			if(score>=95) {
				grade="A+";
			}else {
			grade="A";
			}
		}else if(score>=80) {
			grade="B";
		}else if(score>=70) {
			grade="C";
		}else if(score>=60) {
			grade="D";
		}else {
			grade="F";
		}
		System.out.println(score + "의 학점:" + grade);
		
		int time=24;
		switch(time) {
		case 6:
			System.out.println("기상");
			break;
		case 9:
			System.out.println("출근");
			break;
		case 12:
			System.out.println("점심");
			break;
		case 18:
			System.out.println("퇴근");
			break;
		default:
			System.out.println(".........");
		}
		
	}
	

}
