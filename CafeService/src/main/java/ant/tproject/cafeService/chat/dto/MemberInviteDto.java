package ant.tproject.cafeService.chat.dto;

public class MemberInviteDto {
	private Integer num;
	private String id;
	private String fileimg;
	private Integer roomcode;
	
	public MemberInviteDto() {}
	public MemberInviteDto(int num, String id, String fileimg, Integer roomcode) {
		this.num = num;
		this.id = id;
		this.fileimg = fileimg;
		this.roomcode = roomcode;
	}
	public MemberInviteDto(int num, String id, Integer roomcode) {
		this.num = num;
		this.id = id;
		this.roomcode = roomcode;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileimg() {
		return fileimg;
	}
	public void setFileimg(String fileimg) {
		this.fileimg = fileimg;
	}
	public Integer getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(Integer roomcode) {
		this.roomcode = roomcode;
	}
	
}