package ant.tproject.cafeService.chat.dto;

public class CroomDto {
	private int code;
	private String sub;
	private String lastlog;
	private String img;
	private int unreadmsg;	//안읽은 메세지 숫자
	private String newdate;	//최신글이 올라온 시간을 저장해서 채팅방의 정렬기준을 제공
	private int cafe;
	
	public CroomDto() {}
	public CroomDto(int code, String sub, String lastlog, String img, int unreadmsg, String newdate, int cafe) {
		super();
		this.code = code;
		this.sub = sub;
		this.lastlog = lastlog;
		this.img = img;
		this.unreadmsg = unreadmsg;
		this.newdate = newdate;
		this.cafe = cafe;
	}
	public CroomDto(String sub, int cafe, String img ) {
		super();
		
		this.sub = sub;
		this.cafe = cafe;
		this.img = img;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getLastlog() {
		return lastlog;
	}
	public void setLastlog(String lastlog) {
		this.lastlog = lastlog;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getUnreadmsg() {
		return unreadmsg;
	}
	public void setUnreadmsg(int unreadmsg) {
		this.unreadmsg = unreadmsg;
	}
	public String getNewdate() {
		return newdate;
	}
	public void setNewdate(String newdate) {
		this.newdate = newdate;
	}
	public int getCafe() {
		return cafe;
	}
	public void setCafe(int cafe) {
		this.cafe = cafe;
	}
	
}
