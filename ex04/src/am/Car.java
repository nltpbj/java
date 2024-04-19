package am;

import java.util.Date;

public class Car {//자바빈 : 프로그램할때 제일먼저 만들어야한다
	//필드(속성)
	private int no;
	private String company;
	private String model;
	private String color;
	private int distance;
	private String date;
	
	public Car() {
		
	}
	
	public Car(int no, String company, String model, String color, int distance, String date) {
		super();
		this.no = no;
		this.company = company;
		this.model = model;
		this.color = color;
		this.distance = distance;
		this.date = date;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Car [no=" + no + ", company=" + company + ", model=" + model + ", color=" + color + ", distance="
				+ distance + ", date=" + date + "]";
	}
	
	

}
