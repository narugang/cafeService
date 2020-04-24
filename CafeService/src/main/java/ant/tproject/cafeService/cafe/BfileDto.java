package ant.tproject.cafeService.cafe;

public class BfileDto {
	private Integer idx;
	private String originalname;
	private String storedname;
	private long filesize;
	private String creadtm;
	private Integer postcd;
	
	public BfileDto() {}

	public BfileDto(String originalname, String storedname, long filesize, Integer postcd) {
		super();
		this.originalname = originalname;
		this.storedname = storedname;
		this.filesize = filesize;
		this.postcd = postcd;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getOriginalname() {
		return originalname;
	}
	public void setOriginalname(String originalname) {
		this.originalname = originalname;
	}
	public String getStoredname() {
		return storedname;
	}
	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getCreadtm() {
		return creadtm;
	}
	public void setCreadtm(String readtm) {
		this.creadtm = readtm;
	}
	public Integer getPostcd() {
		return postcd;
	}
	public void setPostcd(Integer postcd) {
		this.postcd = postcd;
	}
}
