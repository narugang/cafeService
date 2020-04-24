package ant.tproject.cafeService.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import ant.tproject.cafeService.member.MemberVO;
import ant.tproject.cafeService.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public void register(MemberVO memberVO) {
		System.out.println("===Pwd여기까지 오니?===");
		System.out.println(memberVO.getPwd());
		System.out.println(memberVO);
		memberDao.insert(memberVO);		
	}

	//아이디 중복 확인 / idCheck
	@Override
	public int idCheck(String id) {
		System.out.println(id+" : [받아온 id값이 idCheck구현체로 넘어옴]");
		int result = memberDao.idCheck(id);
		System.out.println(result+": [받아온 id값이 int result에 들어온 값]");
		return result;
	}

	@Override
	public int nicCheck(String nic) {
		
		int result = memberDao.nicCheck(nic);
		return result;
	}

	//구버전 로그인_S
	@Override
	public String loginCheck(HashMap<String, String> user) {
		
		String result = memberDao.loginCheck(user);
		System.out.println("result="+result);
		return result;
	}
	//구버전 로그인_E
	
	@Override
	public int emailCheck(String email) {
		System.out.println(email);
		int result = memberDao.emailCheck(email);
		return result;
	}

	@Override
	public String findId(HashMap<String, String> findId) {
		
		String result = memberDao.findId(findId);
		return result;
	}

	@Override
	public void changePwd(HashMap<String, String> changePwd) {
		System.out.println("바꿀 비밀번호 입력 전");
		memberDao.changePwd(changePwd);
		System.out.println("바꿀 비밀번호 입력 후");
	}

	@Override
	public void changeInter(HashMap<String, Object> changeInter) {
		
		memberDao.changeInter(changeInter);
		
	}

	@Override
	public String selectInter(String id) {
		
		String result = memberDao.selectInter(id);
		return result;
	}

	@Override
	public void changeIntro(HashMap<String, String> newIntro) {
		
		memberDao.changeIntro(newIntro);
		
	}

	@Override
	public String selectIntro(String id) {
		String result = memberDao.selectIntro(id);
		return result;
	}

	@Override
	public HashMap<String, String> selectAddres(String id) {
		HashMap<String, String> result = memberDao.selectAddres(id);
		System.out.println("result = "+result);
		return result;
	}

	@Override
	public void changeAddress(HashMap<String, String> updateAddress) {
		memberDao.changeAddress(updateAddress);
		System.out.println("addressUpdate성공");
	}

	@Override
	public String selectInterName(int intercd) {
		String result = memberDao.selectInterName(intercd);
		return result;
	}

	@Override
	public MemberVO selectById(String id) {
		
		MemberVO result = memberDao.selectById(id);
		return result;
	}

	@Override
	public void changeEmail(HashMap<String, String> changeEmail) {
		
		memberDao.changeEmail(changeEmail);
	}

	@Override
	public void changeNic(HashMap<String, String> changeNic) {
		memberDao.changeNic(changeNic);
		
	}

	@Override
	public void changeImg(HashMap<String, String> changeImg) {
		memberDao.changeImg(changeImg);
		
	}

	//닉네임 => NUM으로 바꾸는 구문
	@Override
	public int compareNicNum(String nic) {
		return memberDao.compareNicNum(nic);
	}

	//NUM=>닉네임으로 바꾸는 구문
	@Override
	public String compareNumNic(int num) {
		return memberDao.compareNumNic(num);
	}

	@Override
	public List<Integer> selectMemberNum() {
		return memberDao.selectMemberNum();
	}

	@Override
	public List<Integer> selectCafeLord() {
		
		return memberDao.selectCafeLord();
	}
	
	
	
	
}
