package ant.tproject.cafeService.member.authInfo;

//로그인을 하게되면 세션, 쿠키, 인터셉터 등의 이슈를 처리해야 한다. 그러기 위한 코드들을 만들기 위한 
//권한 정보(authInfo) 로그인을 구현해 보자.

public class AuthInfo {
	
	private int num;
	private String id;
	private String nic;
	private String pwd;
	private String inter;
	private String auth;
	
	public AuthInfo(int num, String id, String nic, String pwd, String inter,String auth) {
		this.num = num;
		this.id = id;
		this.nic = nic;
		this.pwd = pwd;
		this.inter= inter;
		this.auth = auth;
	}
	
//	public String getIntro() {
//		return intro;
//	}

	public String getAuth() {
		return auth;
	}
	
	public String getInter() {
		return inter;
	}

	public int getNum() {
		return num;
	}

	public String getPwd() {
		return pwd;
	}

	public String getId() {
		return id;
	}

	public String getNic() {
		return nic;
	}

	@Override
	public String toString() {
		return "AuthInfo [num=" + num + ", id=" + id + ", nic=" + nic + ", pwd=" + pwd + ", inter=" + inter + ", auth="
				+ auth + "]";
	}

	

}
