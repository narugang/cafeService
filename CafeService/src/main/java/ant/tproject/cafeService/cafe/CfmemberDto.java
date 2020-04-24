package ant.tproject.cafeService.cafe;

public class CfmemberDto {
	private Integer cfmem;
	private Integer memnum;
	private Integer cafecd;
	private String regdate;
	private Integer chck;
	private String auth;
	
	public CfmemberDto() {}
	public CfmemberDto(Integer cfmem, Integer memnum, Integer cafecd, String regdate, Integer chck,
			String auth) {
		super();
		this.cfmem = cfmem;
		this.memnum = memnum;
		this.cafecd = cafecd;
		this.regdate = regdate;
		this.chck = chck;
		this.auth = auth;
	}
	public CfmemberDto(Integer memnum, Integer cafecd) {
		super();
		this.memnum = memnum;
		this.cafecd = cafecd;
	}
	public CfmemberDto(Integer memnum, Integer cafecd, Integer chck) {
		super();
		this.memnum = memnum;
		this.cafecd = cafecd;
		this.chck = chck;
	}
	public Integer getCfmem() {
		return cfmem;
	}
	public void setCfmem(Integer cfmem) {
		this.cfmem = cfmem;
	}
	public Integer getMemnum() {
		return memnum;
	}
	public void setMemnum(Integer memnum) {
		this.memnum = memnum;
	}
	public Integer getCafecd() {
		return cafecd;
	}
	public void setCafecd(Integer cafecd) {
		this.cafecd = cafecd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Integer getChck() {
		return chck;
	}
	public void setChck(Integer chck) {
		this.chck = chck;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
}
