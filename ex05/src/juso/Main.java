package juso;

import java.util.*;

public class Main {

	public static void main(String[] args) {
		boolean run=true;
		Scanner scan=new Scanner(System.in);
		JusoDAO dao=new JusoDAO();
		while(run) {
			System.out.println("----------------------------------------------");
			System.out.println("1.주소등록|2.주소조회|3.주소목록|4.주소삭제|0.종료");
			System.out.println("----------------------------------------------");
			System.out.print("선택>");
			String menu=scan.nextLine();
			switch(menu) {
			case"1":// 주소등록
				Juso ju=new Juso();
				//새로운 번호 구하기
				ArrayList<Juso> list=dao.list();
				Juso juso1=list.get(list.size()-1);
				int newNo=juso1.getNo()+1;
				
				System.out.println("번호:" + newNo);
				ju.setNo(newNo);
				//나머지 데이터 입력
				System.out.print("이름:");
				String name=scan.nextLine(); if(name=="") break;
				ju.setName(name);
				System.out.print("전화:");
				String phone=scan.nextLine(); if(phone=="") break;
				ju.setPhone(phone);
				System.out.print("주소:");
				String address=scan.nextLine(); if(address=="") break;
				ju.setAddress(address);
				dao.insert(ju);
				System.out.println("주소등록 완료");
				break;
			case"2"://주소조회
				System.out.print("조회할이름 이나 번호:");
				String names=scan.nextLine();
				Juso juso=dao.read(names);
				if(juso.getNo() == 0) {
					System.out.println(names + "이(가) 존재하지 않습니다!");
				}else {
					System.out.println("번호:" + juso.getNo());
					System.out.println("이름:" + juso.getName());
					System.out.println("전화:" + juso.getPhone());
					System.out.println("주소:" + juso.getAddress());
					
				}
				break;
			case"3"://주소목록
				ArrayList<Juso> array=dao.list();
				for(Juso j:array) {
					System.out.println(j.toString());
				}
				break;
			case"4"://주소삭제
				System.out.print("삭제할번호:");
				String sno=scan.nextLine();
				if(sno=="")break;
				juso = dao.read(sno);
				if(juso.getNo()==0) {
					System.out.println(sno + "번이 존재하지 않습니다.");
				}else {
				dao.delete(Integer.parseInt(sno));
				System.out.println(juso.getName() + "삭제 완료");
				}
				break;
			case"0":
				run=false;
				break;
			default:
				System.out.println("0~4메뉴를 선택하세요");
			
			
			}//sw
		}//while
		System.out.println("프로그램을 종료합니다.");
	}//main

}//class
