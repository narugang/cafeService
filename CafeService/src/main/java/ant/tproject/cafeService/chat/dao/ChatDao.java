package ant.tproject.cafeService.chat.dao;

import java.util.List;
import java.util.Map;

import ant.tproject.cafeService.chat.dto.ClogDto;
import ant.tproject.cafeService.chat.dto.ClogListDto;
import ant.tproject.cafeService.chat.dto.CmemberDto;
import ant.tproject.cafeService.chat.dto.CroomDto;
import ant.tproject.cafeService.chat.dto.MemberInviteDto;
import ant.tproject.cafeService.member.MemberVO;

public interface ChatDao {
	//채팅========================================================================================================================================
	void insertCroom (CroomDto croomdto);
	void insertCmember (CmemberDto cmemberDto);
	void insertCurCmember (CmemberDto cmemberDto);
	void deleteCmember(CmemberDto cmemberDto);
	List<CroomDto> selectCroomList(Map<String, Integer> map);
	void insertClog (ClogDto clogDto);
	Integer selectCroomCodeMax ();
	List<Integer> selectMemCode(Integer roomcode);
	void deleteCroom(Integer roomcode);
	CroomDto selectCroom(Integer memcode);
	List<MemberInviteDto> selectInviteList(MemberInviteDto memberInviteDto);
	Integer countCmemberRoomcode(Integer roomcode);
	List<ClogListDto> selectClogRoomcode(ClogDto clogDto);
	void insertClogRec(Integer recmem);
	//카페 멤버 코드로 체팅 멤버 추가
	void insertCmemberCfmem(CmemberDto cmemberDto);
}
