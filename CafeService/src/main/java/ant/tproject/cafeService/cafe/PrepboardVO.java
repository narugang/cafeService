package ant.tproject.cafeService.cafe;

import java.util.Date;

public class PrepboardVO {
	private int prepnum;
	private int postnum;
	private String prepreason;
	private String prepcontext;
	private Date prepdate;
	
	public int getPrepnum() {
		return prepnum;
	}
	public void setPrepnum(int prepnum) {
		this.prepnum = prepnum;
	}
	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}
	public String getPrepreason() {
		return prepreason;
	}
	public void setPrepreason(String prepreason) {
		this.prepreason = prepreason;
	}
	public String getPrepcontext() {
		return prepcontext;
	}
	public void setPrepcontext(String prepcontext) {
		this.prepcontext = prepcontext;
	}
	public Date getPrepdate() {
		return prepdate;
	}
	public void setPrepdate(Date prepdate) {
		this.prepdate = prepdate;
	}
	
	public PrepboardVO() {
		super();
	}
	public PrepboardVO(int postnum, String prepreason, String prepcontext) {
		super();
		this.postnum = postnum;
		this.prepreason = prepreason;
		this.prepcontext = prepcontext;
	}
	public PrepboardVO(int prepnum, int postnum, String prepreason, String prepcontext, Date prepdate) {
		super();
		this.prepnum = prepnum;
		this.postnum = postnum;
		this.prepreason = prepreason;
		this.prepcontext = prepcontext;
		this.prepdate = prepdate;
	}
	@Override
	public String toString() {
		return "prepBoardVO [prepnum=" + prepnum + ", postnum=" + postnum + ", prepreason=" + prepreason
				+ ", prepcontext=" + prepcontext + ", prepdate=" + prepdate + "]";
	}
	
	
	
}
