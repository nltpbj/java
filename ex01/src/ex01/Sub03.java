package ex01;

public class Sub03 {
	public static void run() {
		//정수타입
		int num1=10;
		
		//실수타입
		float num2=11.5f;
		double num3=12.5;
		
		System.out.println("num1="+num1);
		System.out.println("num2="+num2);
		System.out.println("num3="+num3);
		
		//형변환(정수 -> 실수)
//		num2=num1;
//		System.out.println("num2="+num2);
//		num3=num1;
//		System.out.println("num3="+num3);
		
		//형변환(실수-> 정수)
		num1=(int)num2;
		System.out.println("num1="+num1);
		num1=(int)num3;
		System.out.println("num1="+num1);
				
		//문자타입
		char str1='A';
		String str2="홍길동";
		System.out.println("str1="+ str1);
		System.out.println("str2="+ str2);
		
		//불린타입
		boolean bool1 = true;
		boolean bool2 = false;
		System.out.println("bool1="+bool1);
		System.out.println("bool2="+bool2);
	}

}
