package sale;

import java.text.*;
import java.util.*;

import product.*;

public class Sub {
	public static void run() {
		SaleDAO dao=new SaleDAO();
		ProductDAO pdao=new ProductDAO();
		boolean run = true;
		Scanner scanner = new Scanner(System.in);
		DecimalFormat df=new DecimalFormat("#,###원");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyy-mm-dd");
		while(run) {
			System.out.println("\n=========================================");
			System.out.println("1.상품등록|2.상품조회|3.상품목록|4.상품삭제|0.종료");
			System.out.println("=========================================");
			System.out.print("선택>");
			String menu= scanner.nextLine();
			switch(menu) {
			case "1" :
				System.out.print("상품코드>");
				String code1=scanner.nextLine();
				ProductVO vo1=pdao.read(code1);
				if(vo1.getCode()==null) {
					System.out.println(code1+"번 상품이 존재하지 않습니다.");
				}else {
					SaleVO svo=new SaleVO();
					svo.setCode(code1);
					
					System.out.println("상품명:" + vo1.getName());
					String today=sdf.format(new Date());
					
					System.out.print("판매일:" + today + ">");
					String date=scanner.nextLine();
					if(date!="") {
						svo.setSale_date(date);
					}else {
						svo.setSale_date(today);
					}
					System.out.print("판매가:" + vo1.getPrice() + ">");
					String price=scanner.nextLine();
					if(price!="") {
						svo.setPrice(Integer.parseInt(price));
					}else {
						svo.setPrice(vo1.getPrice());
					}
					System.out.print("수량>");
					String qnt=scanner.nextLine();
					if(qnt!="") {
						svo.setQnt(Integer.parseInt(qnt));
					}else {
						svo.setQnt(1);
					}
					System.out.println(svo.toString());
					dao.insert(svo);
					System.out.println("매출등록완료!");
				}
				break;
			case "2" ://상품조회
				System.out.print("조회할상품코드:");
				String code2=scanner.nextLine();
				ProductVO vo2=pdao.read(code2);
				if(vo2.getCode()==null) {
					System.out.println(code2 + "번 상품이 존재하지 않습니다");
				}else {
					System.out.println("상품이름:" + vo2.getName());
					System.out.println("상품단가:" + df.format(vo2.getPrice()));
				}
				break;
			case "3" ://상품현황
				for(SaleVO vo:dao.list()) {
					System.out.printf("%s\t%s(%s)\t%d개\t%,d원\n",
							vo.getSale_date(), vo.getName(), vo.getCode(), vo.getQnt()
							,vo.getPrice());
				}
				break;
			case "4" :
				break;
			case "0" :
				System.out.println("판매관리를 종료합니다.");
				run = false;
				break;
			default:
				System.out.println("0~4 메뉴를 입력하세요!");
				break;
			}//switch   
		}//while
	}   
}//method