package am;

import java.util.*;

public class Sub02 {
	public static void run() {
		ArrayList<Student> students=new ArrayList<>();
		students.add(new Student("100", "홍길동", "인천", "010-1234-3333"));
		students.add(new Student("101", "강감찬", "서울", "010-2344-2222"));
		students.add(new Student("102", "이순신", "부산", "010-1535-1111"));
		
		for(Student s:students) {
			s.print();
		}
//		for(int i=0; i<students.size();i++) {
//			Student s=students.get(i);
//			s.print();
//		}
	}
}
