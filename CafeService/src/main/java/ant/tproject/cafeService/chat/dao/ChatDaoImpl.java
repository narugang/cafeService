package ant.tproject.cafeService.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ant.tproject.cafeService.chat.dto.ClogDto;
import ant.tproject.cafeService.chat.dto.ClogListDto;
import ant.tproject.cafeService.chat.dto.CmemberDto;
import ant.tproject.cafeService.chat.dto.CroomDto;
import ant.tproject.cafeService.chat.dto.MemberInviteDto;

@Repository
public class ChatDaoImpl implements ChatDao{	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ChatDaoImpl( SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//채팅========================================================================================================================================
	@Override
	public void insertCmember(CmemberDto cmemberDto) {
		sqlSessionTemplate.insert("Cmember.insertCmember", cmemberDto);	
	}
	@Override
	public void insertCroom(CroomDto croomdto) {
		sqlSessionTemplate.insert("Croom.insertCroom", croomdto); 
	}
	@Override
	public void insertCurCmember(CmemberDto cmemberDto) {
		sqlSessionTemplate.insert("Cmember.insertCurCmember", cmemberDto);
	}
	@Override
	public void deleteCmember(CmemberDto cmemberDto) {
		sqlSessionTemplate.delete("Cmember.deleteCmember", cmemberDto);
	}
	@Override
	public List<CroomDto> selectCroomList(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("Croom.selectCroomList", map);
	}
	@Override
	public void insertClog(ClogDto clogDto) {
		System.out.println("DAO");
		sqlSessionTemplate.insert("Clog.insertClog", clogDto);
	}
	@Override
	public Integer selectCroomCodeMax() {
		Integer code = (Integer)sqlSessionTemplate.selectOne("Croom.selectCroomCodeMax");
		System.out.println("code"+code);
		code++;
		return code;
	}
	@Override
	public List<Integer> selectMemCode(Integer roomcode) {
		return sqlSessionTemplate.selectList("Cmember.selectMemCode", roomcode);
	}
	@Override
	public void deleteCroom(Integer roomcode) {
		sqlSessionTemplate.delete("Croom.deleteCroom", roomcode);
	}
	@Override
	public CroomDto selectCroom(Integer memcode) {
		return sqlSessionTemplate.selectOne("Croom.selectCroom", memcode);
	}
	@Override
	public List<MemberInviteDto> selectInviteList(MemberInviteDto memberInviteDto) {
		return sqlSessionTemplate.selectList("Cmember.selectInviteList", memberInviteDto);
	}
	@Override
	public Integer countCmemberRoomcode(Integer roomcode) {
		return sqlSessionTemplate.selectOne("Cmember.countCmemberRoomcode", roomcode);
	}
	@Override
	public List<ClogListDto> selectClogRoomcode(ClogDto clogDto) {
		return sqlSessionTemplate.selectList("Clog.selectClogRoomcode", clogDto);
	}
	@Override
	public void insertClogRec(Integer recmem) {
		sqlSessionTemplate.insert("ClogRec.insertClogRec", recmem);
	}
	//카페멤버 코드로 채팅멤버 추가
	@Override
	public void insertCmemberCfmem(CmemberDto cmemberDto) {
		sqlSessionTemplate.insert("Cmember.insertCmemberCfmem", cmemberDto);
	}
}
