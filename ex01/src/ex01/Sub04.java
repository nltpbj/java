package ex01;

public class Sub04 {
	public static void run() {
		//산술연산자
		int num1=15;
		int num2=4;
		int sum=num1+num2;
		System.out.println(num1 + "+" + num2 + "=" + sum);
		int sub=num1-num2;
		System.out.println(num1 + "-" + num2 + "=" + sub);
		int mul=num1*num2;
		System.out.println(num1 + "*" + num2 + "=" + mul);
		float div=num1/(float)num2;
		System.out.println(num1 + "/" + num2 + "=" + div);
		
		//관계연산자
		boolean result=num1>num2;
		System.out.println(num1 + "이 " + num2 + "보다 크다:" + result);
		result=num1<num2;
		System.out.println(num1 + "이 " + num2 + "보다 작다:" + result);
		result=num1==num2;
		System.out.println(num1 + "과 " + num2 + "가 같다:" + result);
		result=num1!=num2;
		System.out.println(num1 + "과 " + num2 + "가 같지않다:" + result);
		
		//논리연산자(and:&&, or:||, not:!)
		boolean b1=true;
		boolean b2=false;
		result = b1 && b2;
		System.out.println(result);
		result = b1 || b2;
		System.out.println(result);
		result = !b1;
		System.out.println(result);
	}
}

