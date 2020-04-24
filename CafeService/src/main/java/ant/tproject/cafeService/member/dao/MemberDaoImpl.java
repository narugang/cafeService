package ant.tproject.cafeService.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ant.tproject.cafeService.member.MemberVO;

public class MemberDaoImpl implements MemberDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//회원가입
	@Override
	public void insert(MemberVO memberVO) {
		System.out.println(memberVO + "insert로 왜 찍냐고");
		System.out.println(memberVO.getPwd());
		sqlSessionTemplate.insert("memberDAO.insert", memberVO);
		
	}

	//*************여기 문제가 생길 수 있다.**************
	@Override
	public MemberVO selectById(String id) {
		
		MemberVO result = sqlSessionTemplate.selectOne("memberDAO.selectById", id);
		return result;
	}

	//아이디 중복 확인
	@Override
	public int idCheck(String id) {
		
		int result = sqlSessionTemplate.selectOne("memberDAO.idCheck", id);
		System.out.println(result+" : 1");
		return  result;
	}

	//닉네임 중복 체크
	@Override
	public int nicCheck(String nic) {

		int result = sqlSessionTemplate.selectOne("memberDAO.nicCheck", nic);
		return result;
	}

	//로그인 시 아이디 비밀번호 유효성 체크
	@Override
	public String loginCheck(HashMap<String, String> user) {
		String result = sqlSessionTemplate.selectOne("memberDAO.loginCheck", user);
		
		return result;
	}

	//아이디 찾기
	@Override
	public String findId(HashMap<String, String> findId) {
//		
		String result = sqlSessionTemplate.selectOne("memberDAO.findId", findId);
		return result;
	}
	
	@Override
	public int emailCheck(String email) {
		int result = sqlSessionTemplate.selectOne("memberDAO.emailCheck", email);
		
		return result;
	}


	@Override
	public void changePwd(HashMap<String, String> changePwd) {
		sqlSessionTemplate.update("memberDAO.changePwd", changePwd);
		System.out.println("비밀번호가 [UPDATE 쿼리]에 들어감");
	}


	@Override
	public void changeInter(HashMap<String, Object> changeInter) {
		sqlSessionTemplate.update("memberDAO.changeInter", changeInter);
		
	}

	@Override
	public String selectInter(String id) {
		String result = sqlSessionTemplate.selectOne("memberDAO.selectInter",id);
		return result;
	}


	@Override
	public void changeIntro(HashMap<String, String> newIntro) {
		
		sqlSessionTemplate.update("memberDAO.changeIntro", newIntro);
		
	}


	@Override
	public String selectIntro(String id) {
		String result = sqlSessionTemplate.selectOne("memberDAO.selectIntro", id);
		return result;
	}


	@Override
	public HashMap<String, String> selectAddres(String id) {
		
		HashMap<String, String> result = sqlSessionTemplate.selectOne("memberDAO.selectAddres", id);
		return result;
	}


	@Override
	public void changeAddress(HashMap<String, String> updateAddress) {
		sqlSessionTemplate.update("memberDAO.changeAddress", updateAddress);
		
	}


	@Override
	public String selectInterName(int intercd) {
		String result = sqlSessionTemplate.selectOne("memberDAO.selectInterName", intercd);
		return result;
	}


	@Override
	public void changeEmail(HashMap<String, String> changeEmail) {
		sqlSessionTemplate.update("memberDAO.changeEmail", changeEmail);
		
	}


	@Override
	public void changeNic(HashMap<String, String> changeNic) {
		sqlSessionTemplate.update("memberDAO.changeNic", changeNic);
		
	}


	@Override
	public void changeImg(HashMap<String, String> changeImg) {
		sqlSessionTemplate.update("memberDAO.changeImg", changeImg);
		
	}

	//메시지 보내기에서 닉네임을 => NUM으로 바꿔주는 구문
	@Override
	public int compareNicNum(String nic) {

		return sqlSessionTemplate.selectOne("memberDAO.compareNicNum", nic);
		
	}

	//메시지 보내기에서 NUM을 => Nic으로 바꿔주는 구문
	@Override
	public String compareNumNic(int num) {
		
		return sqlSessionTemplate.selectOne("memberDAO.compareNumNic", num);
	}


	@Override
	public List<Integer> selectMemberNum() {
		
		return sqlSessionTemplate.selectList("memberDAO.selectMemberNum");
	}


	@Override
	public List<Integer> selectCafeLord() {
		
		return sqlSessionTemplate.selectList("memberDAO.selectCafeLord");
	}
	
	

}
