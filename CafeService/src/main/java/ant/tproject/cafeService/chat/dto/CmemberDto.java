package ant.tproject.cafeService.chat.dto;

public class CmemberDto {
	private int roomcode;
	private int memcode;
	
	public CmemberDto() {}
	public CmemberDto(int roomcode, int memcode) {
		this.roomcode = roomcode;
		this.memcode = memcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getMemcode() {
		return memcode;
	}
	public void setMemcode(int memcode) {
		this.memcode = memcode;
	}
}
