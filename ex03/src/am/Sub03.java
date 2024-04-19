package am;

import java.util.*;

public class Sub03 {
	public static void run() {
		ArrayList<Score> scores=new ArrayList<>();
		Score s1=new Score("홍길동", 90,90,90);
		Score s2=new Score("심청이", 95,95,95);
		Score s3=new Score("강감찬", 70,60,70);
		
		scores.add(s1);
		scores.add(s2);
		scores.add(s3);
		
		for(Score s:scores) {
			s.print();
		}
	}
}
