package simple;

import java.util.Calendar;
import java.util.Date;

public class CalendarBean {
	private Date today;
	private Calendar cal;
	private String greeting;

	public CalendarBean() {
		today = new Date();
		cal = Calendar.getInstance();
	}
	
	
	public String getToday() {
		return today.toString();
	}
	public int getYear() {
		return cal.get(Calendar.YEAR);
	}
	public int getMonth() {
		return cal.get(Calendar.MONTH)+1;
	}
	public int getDate() {
		return cal.get(Calendar.DATE);
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	
	public String getGreeting() {
		return greeting;
	}
	

}
