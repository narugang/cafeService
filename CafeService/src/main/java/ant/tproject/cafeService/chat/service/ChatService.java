package ant.tproject.cafeService.chat.service;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;

import ant.tproject.cafeService.chat.dto.ClogDto;
import ant.tproject.cafeService.chat.dto.ClogListDto;
import ant.tproject.cafeService.chat.dto.CmemberDto;
import ant.tproject.cafeService.chat.dto.CroomDto;
import ant.tproject.cafeService.chat.dto.MemberInviteDto;
import ant.tproject.cafeService.member.MemberVO;

public interface ChatService {
	List<CroomDto>  getCroomList(Map<String, Integer> map) throws JsonProcessingException;
	void insertLog(Integer roomcode, Integer memcode, String contxt);
	CroomDto createCroom(CroomDto croom, Integer memcode);
	void exitCroom(int roomcode, int memcode);
	void insertCmember(CmemberDto cmemberDto);
	List<MemberInviteDto> selectInviteList(MemberInviteDto memberInviteDto);
	Integer countCmemberRoomcode(Integer roomcode);
	List<ClogListDto> selectClogRoomcode(ClogDto clogDto);
	void insertClogRec(Integer recmem);
	//카페멤버 코드로 채팅멤버 추가
	void insertCmemberCfmem(CmemberDto cmemberDto);
}
