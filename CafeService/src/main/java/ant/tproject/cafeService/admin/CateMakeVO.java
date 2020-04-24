package ant.tproject.cafeService.admin;

import org.apache.ibatis.type.Alias;

//관리자
@Alias("cateMakeVO")
public class CateMakeVO {

	private int intercd;
	private String intername;
	private String intercate;
	
	public int getIntercd() {
		return intercd;
	}
	public void setInternum(int intercd) {
		this.intercd = intercd;
	}
	public String getIntername() {
		return intername;
	}
	public void setIntername(String intername) {
		this.intername = intername;
	}
	public String getIntercate() {
		return intercate;
	}
	public void setIntercate(String intercate) {
		this.intercate = intercate;
	}
	public CateMakeVO(int intercd, String intername, String intercate) {
		super();
		this.intercd = intercd;
		this.intername = intername;
		this.intercate = intercate;
	}
	
	public CateMakeVO() {
		super();
	}
	@Override
	public String toString() {
		return "CateMakeVO [intercd=" + intercd + ", intername=" + intername + ", intercate=" + intercate + "]";
	}
	
	

	
}
