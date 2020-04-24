package ant.tproject.cafeService.member;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("memberVO")
public class MemberVO {

	private int num;
	private String id;
	private String nic;
	private String name;
	private String email;
	private String pwd;
	private String confirmPwd; 
	private String adres;
	
	private int postcode;
	private String detailadres;
	private String extraadres;
	
	private String inter;
	private Date date;
	
	private String intro;
	
	private String auth;
	
	private String fileImg;
	private String thumbImg;

	
	
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int regNum) {
		this.num = regNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}	
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
	

	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getDetailadres() {
		return detailadres;
	}
	public void setDetailadres(String detailadres) {
		this.detailadres = detailadres;
	}
	public String getExtraadres() {
		return extraadres;
	}
	public void setExtraadres(String extraadres) {
		this.extraadres = extraadres;
	}
	public MemberVO() {
		super();
	}
	
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
			
	public String getFileImg() {
		return fileImg;
	}
	public void setFileImg(String fileImg) {
		this.fileImg = fileImg;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	
	public MemberVO(int num, String id, String nic, String name, String email, String pwd, String confirmPwd,
			String adres, int postcode, String detailadres, String extraadres, String inter, String fileImg,
			Date date, String intro, String thumbImg, String auth) {
		super();
		this.num = num;
		this.id = id;
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.confirmPwd = confirmPwd;
		this.adres = adres;
		this.postcode = postcode;
		this.detailadres = detailadres;
		this.extraadres = extraadres;
		this.inter = inter;
		this.fileImg = fileImg;
		this.date = date;
		this.intro = intro;
		this.thumbImg = thumbImg; 
		this.auth = auth;
	}
	
	public MemberVO(int num, String id, String nic, String name, String email, String pwd, String confirmPwd,
			String adres, int postcode, String detailadres, String extraadres, String inter,
			Date date, String intro) {
		super();
		this.num = num;
		this.id = id;
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.confirmPwd = confirmPwd;
		this.adres = adres;
		this.postcode = postcode;
		this.detailadres = detailadres;
		this.extraadres = extraadres;
		this.inter = inter;
		this.date = date;
		this.intro = intro;
	}
	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", nic=" + nic + ", name=" + name + ", email=" + email + ", pwd="
				+ pwd + ", confirmPwd=" + confirmPwd + ", adres=" + adres + ", postcode=" + postcode + ", detailadres="
				+ detailadres + ", extraadres=" + extraadres + ", inter=" + inter + ", date=" + date + ", intro="
				+ intro + ", auth=" + auth + ", fileImg=" + fileImg + ", thumbImg=" + thumbImg + "]";
	}
	
	
	
	
	
	
}
