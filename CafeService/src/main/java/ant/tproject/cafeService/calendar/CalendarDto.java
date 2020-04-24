package ant.tproject.cafeService.calendar;

public class CalendarDto {
	private Integer calcode;
	private Integer calmem;
	private String title;
	private String calcontxt;
	private String calstart;
	private String end;
	private String writedate;
	private String color;
	private Integer cafe;
	
	
	public CalendarDto() {}
	public CalendarDto(Integer calcode, Integer calmem, String title, String calcontxt, String calstart, String end,
			String writedate, String color, Integer cafe) {
		super();
		this.calcode = calcode;
		this.calmem = calmem;
		this.title = title;
		this.calcontxt = calcontxt;
		this.calstart = calstart;
		this.end = end;
		this.writedate = writedate;
		this.color = color;
		this.cafe = cafe;
	}
	public CalendarDto(Integer calmem, String title, String calcontxt, String calstart, String end,
			String color, Integer cafe) {
		super();
		this.calmem = calmem;
		this.title = title;
		this.calcontxt = calcontxt;
		this.calstart = calstart;
		this.end = end;
		this.color = color;
		this.cafe = cafe;
	}
	public Integer getCalcode() {
		return calcode;
	}
	public void setCalcode(Integer calcode) {
		this.calcode = calcode;
	}
	public Integer getCalmem() {
		return calmem;
	}
	public void setCalmem(Integer calmem) {
		this.calmem = calmem;
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
	public Integer getCafe() {
		return cafe;
	}
	public void setCafe(Integer cafe) {
		this.cafe = cafe;
	}
	
}
