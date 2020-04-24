package ant.tproject.cafeService.member.authInfo;

import org.springframework.security.crypto.bcrypt.BCrypt;

import ant.tproject.cafeService.member.MemberVO;
import ant.tproject.cafeService.member.dao.MemberDao;

public class AuthService {
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public AuthInfo authenticate(String id, String pwd) throws Exception {
		MemberVO member = memberDao.selectById(id);

		if(member == null) {
			throw new Exception();
		}
		//추 후 삭제 예정_S
		if(member.getId().equals("admin")) {
			return new AuthInfo(member.getNum(),member.getId(), member.getNic(), member.getPwd(), member.getInter(), member.getAuth());
		}//추 후 삭제 예정_E
		if(!BCrypt.checkpw(pwd, member.getPwd())) {
			throw new Exception();
		}
		return new AuthInfo(member.getNum(),member.getId(), member.getNic(), member.getPwd(), member.getInter(), member.getAuth());		
	}
	
	
}
