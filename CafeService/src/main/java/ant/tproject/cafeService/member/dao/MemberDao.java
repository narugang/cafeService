package ant.tproject.cafeService.member.dao;

import java.util.HashMap;
import java.util.List;

import ant.tproject.cafeService.member.MemberVO;

public interface MemberDao {

	//회원가입
	public abstract void insert(MemberVO memberVO);
	
	//로그인 인증
	public abstract MemberVO selectById(String id);
	
	//아이디 중복 확인
	public abstract int idCheck(String id);
	
	//닉네임 중복 확인
	public abstract int nicCheck(String nic);
	
	public abstract String loginCheck(HashMap<String, String> user);
	
	public abstract String findId(HashMap<String, String> findId);
	
	public abstract int emailCheck(String email);
	
	//비밀번호 변경
	public abstract void changePwd(HashMap<String, String> changePwd);
	
	//관심사 업데이트
	public abstract void changeInter(HashMap<String, Object> changeInter);
	
	//내 관심사 가져오기
	public abstract String selectInter(String id);
	
	//자기소개 업데이트
	public abstract void changeIntro(HashMap<String, String> newIntro);
	
	//자기소개 가져오기
	public abstract String selectIntro(String id);
	
	public abstract HashMap<String, String> selectAddres(String id);
	
	public abstract void changeAddress(HashMap<String, String> updateAddress);
	
	public abstract String selectInterName(int intercd);
	
	public abstract void changeEmail(HashMap<String, String> changeEmail);
	
	public abstract void changeNic(HashMap<String, String> changeNic);
	
	public abstract void changeImg(HashMap<String, String> changeImg);
	
	//nic=>num
	public abstract int compareNicNum(String nic);
	
	//num=>nic
	public abstract String compareNumNic(int num);
	
	public abstract List<Integer> selectMemberNum();
	
	public abstract List<Integer> selectCafeLord();
}
