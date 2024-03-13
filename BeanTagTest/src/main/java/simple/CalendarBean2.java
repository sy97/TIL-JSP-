package simple;

import java.util.Calendar;
import java.util.Date;

public class CalendarBean2 {
	private Date today;
	private int year;
	private int month;
	private int date;
	
	public CalendarBean2() {
		today = new Date();
	}
	
	//싱글톤은 인스턴스를 한번만 생성해야하니까 생성자에 넣으면 안됨.
	Calendar cal = Calendar.getInstance();
	
	public Date getToday() {
		return today;
	}
	public int getYear() {
		year = cal.get(Calendar.YEAR);
		return year;
	}
	public int getMonth() {
		month = cal.get(Calendar.MONTH) + 1;
		return month;
	}
	public int getDate() {
		date = cal.get(Calendar.DATE);
		return date;
	}

	
	

}
