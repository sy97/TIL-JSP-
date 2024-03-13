package scope;

import java.util.Timer;

public class IncludeBean {
	private String header;
	private String footer;
	
	Timer t = new Timer();
	
	
	public void setHeader(String header) {
		this.header = header;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}
	
	public String getHeader() {
		return header;
	}
	
	public String getFooter() {
		return footer;
	}
}
