package ant.tproject.cafeService.cafe;

public class CfmemberNicDto {
	private Integer cfmem;
	private String nic;
	private String regdate;
	private String thumbimg;
	private String auth;
	
	public CfmemberNicDto() {}
	public CfmemberNicDto(Integer cfmem, String nic, String regdate, String thumbimg, String auth) {
		super();
		this.cfmem = cfmem;
		this.nic = nic;
		this.regdate = regdate;
		this.thumbimg = thumbimg;
		this.auth = auth;
	}
	
	public Integer getCfmem() {
		return cfmem;
	}
	public void setCfmem(Integer cfmem) {
		this.cfmem = cfmem;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "CfmemberNicDto [cfmem=" + cfmem + ", nic=" + nic + ", regdate=" + regdate + ", thumbimg=" + thumbimg
				+ ", auth=" + auth + "]";
	}	
	
}
