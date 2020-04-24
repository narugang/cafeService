package ant.tproject.cafeService.member.controller;

//폼에 입력 받은 값을 전달받기 위한 LoginCommand 클래스

public class LoginCommand {

	private String id;
	private String pwd;
	
	public LoginCommand() {
		System.out.println("LoginCommand 객체 생성");
	}
	
	public String getId() {
		
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;	
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}	
}
