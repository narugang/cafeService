package ant.tproject.cafeService.calendar;

public class CalendarNicDto {
	private Integer calcode;
	private String thumbimg;
	private String nic;
	private String title;
	private String calcontxt;
	private String calstart;
	private String end;
	private String writedate;
	private String color;
	
	public CalendarNicDto() {}

	public CalendarNicDto(Integer calcode, String thumbimg, String nic, String title, String calcontxt, String calstart,
			String end, String writedate, String color) {
		super();
		this.calcode = calcode;
		this.thumbimg = thumbimg;
		this.nic = nic;
		this.title = title;
		this.calcontxt = calcontxt;
		this.calstart = calstart;
		this.end = end;
		this.writedate = writedate;
		this.color = color;
	}

	public Integer getCalcode() {
		return calcode;
	}

	public void setCalcode(Integer calcode) {
		this.calcode = calcode;
	}

	public String getThumbimg() {
		return thumbimg;
	}

	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCalcontxt() {
		return calcontxt;
	}

	public void setCalcontxt(String calcontxt) {
		this.calcontxt = calcontxt;
	}

	public String getCalstart() {
		return calstart;
	}

	public void setCalstart(String calstart) {
		this.calstart = calstart;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
