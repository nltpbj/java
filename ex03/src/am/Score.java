package am;

public class Score {
	//필드(속성)
	String name;
	int kor;
	int eng;
	int mat;
	
	//생성자
	public Score(){
		
	}
	
	public Score(String name, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	//메서드
	public int total() {  //total의 값이 int타입이기 때문에 void가 아닌 int를 사용
		int total= kor+eng+mat;
		return total;
	}
	
	public double avg() {
		return (kor+eng+mat)/3.;
	}
	
	public void print() {
		System.out.printf("%s\t%d\t%d\t%d\t%d\t%.2f\t%s\n", name,kor,eng,mat,total(),avg(),grade());
	}
	public String grade() {
		String grade="F";
		if(avg()>=90) {
			if(avg()>=95) {
				grade="A+";
			}else {
				grade="A0";
			}
		}else if(avg()>=80) {
			if(avg()>=85) {
				grade="B+";
			}else {
				grade="B0";
			}
		}else if(avg()>=70) {
			if(avg()>=75) {
				grade="C+";
			}else {
				grade="C0";
			}
		}else if(avg()>=60) {
			if(avg()>=65) {
				grade="D+";
			}else {
				grade="D0";
			}
		}else {
			grade="F";
		}
		return grade;
	}
}
