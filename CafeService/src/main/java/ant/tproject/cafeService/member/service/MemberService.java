package ant.tproject.cafeService.member.service;

import java.util.HashMap;
import java.util.List;

import ant.tproject.cafeService.member.MemberVO;

public interface MemberService {

	//Member가입을 위한 서비스 인터페이스를 구현해 놓았다.
	public abstract void register(MemberVO memberVO);
	
	//idCheck 아이디 중복확인
	public abstract int idCheck(String id);
	
	//닉네임 중복 체크
	public abstract int nicCheck(String nic);

	public abstract String loginCheck(HashMap<String, String> user); 
	
	public abstract int emailCheck(String email);
	
	public abstract String findId(HashMap<String, String> findId);
	
	public abstract void changePwd(HashMap<String, String> changePwd);
	
	public abstract void changeInter(HashMap<String, Object> changeInter);
	
	public abstract String selectInter(String id);
	
	public abstract void changeIntro(HashMap<String, String> newIntro);
	
	public abstract String selectIntro(String id);
	
	public abstract HashMap<String, String> selectAddres(String id);
	
	public abstract void changeAddress(HashMap<String, String> updateAddress);
	
	public abstract String selectInterName(int intercd);
	
	public abstract MemberVO selectById(String id);
	
	public abstract void changeEmail(HashMap<String, String> changeEmail);
	
	public abstract void changeNic(HashMap<String, String> changeNic);
	
	public abstract void changeImg(HashMap<String, String> changeImg);
	
	public abstract int compareNicNum(String nic);
	
	public abstract String compareNumNic(int num);
	
	public abstract List<Integer> selectMemberNum();
	
	public abstract List<Integer> selectCafeLord();
}
