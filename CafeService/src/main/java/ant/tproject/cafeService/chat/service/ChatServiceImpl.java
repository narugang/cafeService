 package ant.tproject.cafeService.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import ant.tproject.cafeService.chat.dao.ChatDao;
import ant.tproject.cafeService.chat.dto.ClogDto;
import ant.tproject.cafeService.chat.dto.ClogListDto;
import ant.tproject.cafeService.chat.dto.CmemberDto;
import ant.tproject.cafeService.chat.dto.CroomDto;
import ant.tproject.cafeService.chat.dto.MemberInviteDto;

@Service
public class ChatServiceImpl implements ChatService{
	private ChatDao chatDao;
	
	public ChatDao getChatDao() {
		return chatDao;
	}
	public void setChatDao(ChatDao chatDao) {
		this.chatDao = chatDao;
	}
	@Override
	public CroomDto createCroom(CroomDto croom, Integer memcode) {
		Integer code = chatDao.selectCroomCodeMax();
		croom.setCode(code);
		chatDao.insertCroom(croom);
		CmemberDto cmemberDto = new CmemberDto(code, memcode); 
		chatDao.insertCurCmember(cmemberDto);
		return chatDao.selectCroom(memcode);
	}
	@Override
	public void exitCroom(int roomcode, int memcode) {
		CmemberDto cmemberDto = new CmemberDto(roomcode, memcode); 
		chatDao.deleteCmember(cmemberDto);
		if(chatDao.selectMemCode(roomcode).size() == 0)
			chatDao.deleteCroom(roomcode);
	}
	@Override
	public List<CroomDto> getCroomList(Map<String, Integer> map) {
		List<CroomDto> roomList = chatDao.selectCroomList(map);
		return roomList;
	}
	@Override
	public void insertLog(Integer roomcode, Integer memcode, String contxt) {
		System.out.println("Service");
		ClogDto clogDto = new ClogDto(roomcode, memcode, contxt);
		chatDao.insertClog(clogDto);
	}
	public void insertCmember(CmemberDto cmemberDto) {
		chatDao.insertCmember(cmemberDto);
	}
	@Override
	public List<MemberInviteDto> selectInviteList(MemberInviteDto memberInviteDto) {
		return chatDao.selectInviteList(memberInviteDto);
	}
	@Override
	public Integer countCmemberRoomcode(Integer roomcode) {
		return chatDao.countCmemberRoomcode(roomcode);
	}
	@Override
	public List<ClogListDto> selectClogRoomcode(ClogDto clogDto) {
		return chatDao.selectClogRoomcode(clogDto);
	}
	@Override
	public void insertClogRec(Integer recmem) {
		chatDao.insertClogRec(recmem);
	}
	@Override
	public void insertCmemberCfmem(CmemberDto cmemberDto) {
		chatDao.insertCmemberCfmem(cmemberDto);
	}
}

