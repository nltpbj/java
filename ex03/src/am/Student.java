package am;

public class Student {
	//필드(속성)
	String no;
	String name;
	String juso;
	String phone;
	
	//생성자1
	public Student() {
		
	}
	public Student(String no, String name) { //생성자2   우클 소스 -> generate fields
		this.no = no;  //this는 필드의 속성을 말함
		this.name = name;
	}
	
	
	public Student(String no, String name, String juso, String phone) {
		super();
		this.no = no;
		this.name = name;
		this.juso = juso;
		this.phone = phone;
	}
	//메서드
	public void print() {
		System.out.println("----------------------------------------");
		System.out.printf("학번:%s\n이름:%s\n주소:%s\n전화:%s\n", no,name,juso,phone);
	}
}
