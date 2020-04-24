package ant.tproject.cafeService.chat.dto;

public class ClogDto {
	private Integer code;
	private Integer roomcode;
	private Integer sendmem;
	private String sendda;
	private String contxt;
	private String fileadd;
	
	public ClogDto() {}
	public ClogDto(Integer code, Integer roomcode, Integer sendmem, String sendda, String contxt, String fileadd) {
		this.code = code;
		this.roomcode = roomcode;
		this.sendmem = sendmem;
		this.sendda = sendda;
		this.contxt = contxt;
		this.fileadd = fileadd;
	}
	public ClogDto(Integer roomcode,String sendda, Integer sendmem) {
		this.roomcode = roomcode;
		this.sendmem = sendmem;
		this.sendda = sendda;
	}
	public ClogDto(Integer roomcode, Integer sendmem, String contxt) {
		this.roomcode = roomcode;
		this.sendmem = sendmem;
		this.contxt = contxt;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(Integer roomcode) {
		this.roomcode = roomcode;
	}
	public Integer getSendmem() {
		return sendmem;
	}
	public void setSendmem(Integer sendmem) {
		this.sendmem = sendmem;
	}
	public String getSendda() {
		return sendda;
	}
	public void setSendda(String sendda) {
		this.sendda = sendda;
	}
	public String getContxt() {
		return contxt;
	}
	public void setContxt(String contxt) {
		this.contxt = contxt;
	}
	public String getFileadd() {
		return fileadd;
	}
	public void setFileadd(String fileadd) {
		this.fileadd = fileadd;
	}
	
}
