package ant.tproject.cafeService.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import ant.tproject.cafeService.chat.dto.ClogDto;
import ant.tproject.cafeService.chat.dto.ClogListDto;
import ant.tproject.cafeService.chat.dto.CmemberDto;
import ant.tproject.cafeService.chat.dto.CroomDto;
import ant.tproject.cafeService.chat.dto.MemberInviteDto;
import ant.tproject.cafeService.chat.service.ChatService;
import ant.tproject.cafeService.member.controller.MemberController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatController {
	private ChatService chatService;
	
	public void setChatService(ChatService chatService) {
		this.chatService = chatService;
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "member";
	}
	
	//채팅========================================================================================================================================
	@RequestMapping(value = "/roomlist", method = RequestMethod.GET)
	@ResponseBody
	public List<CroomDto> searchGet(HttpSession session,HttpServletRequest request, Model model) throws JsonProcessingException{
		Map<String, Integer> map = new HashMap<>();
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));;
		map.put("memcode", memcode);
		map.put("cafe", cafe);
		List<CroomDto> roomList = chatService.getCroomList(map);
		return roomList;
	}
	@RequestMapping(value = "/roomjoin", method = RequestMethod.GET)
	public String roomJoin(HttpSession session, HttpServletRequest request, String id, Model model) {
		model.addAttribute("mem", Integer.parseInt(MemberController.loginMemberCheck(session)));
		Integer roomcode = Integer.parseInt(request.getParameter("roomcode"));
		session.setAttribute("roomcode", roomcode);
		model.addAttribute("memcount", chatService.countCmemberRoomcode(roomcode)); 
		return "roomjoin";
	}
	@RequestMapping(value = "/memcount", method = RequestMethod.GET)
	@ResponseBody
	public String memcount(HttpSession session, HttpServletRequest request, String id, Model model) {
		Integer roomcode =(Integer)session.getAttribute("roomcode");
		String memcount = chatService.countCmemberRoomcode(roomcode).toString();
		return memcount;
	}
	@RequestMapping(value = "/roomDelete", method = RequestMethod.POST)
	@ResponseBody
	public List<CroomDto> roomDelete(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Map<String, Integer> map = new HashMap<>();
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));;
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer roomcode = Integer.parseInt(request.getParameter("roomcode"));
		chatService.exitCroom(roomcode, memcode);
		map.put("memcode", memcode);
		map.put("cafe", cafe);
		List<CroomDto> roomlist = chatService.getCroomList(map);
		return roomlist;
	}
	@RequestMapping(value = "/roomCreate", method = RequestMethod.POST)
	@ResponseBody
	public List<CroomDto> roomcreatePo(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Map<String, Integer> map = new HashMap<>();
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));;
		CroomDto croom = new CroomDto((String)request.getParameter("sub"), cafe, "img" );
		chatService.createCroom(croom, memcode);
		map.put("memcode", memcode); 
		map.put("cafe", cafe);
		List<CroomDto> roomlist = chatService.getCroomList(map);
		return roomlist;
	}
	@RequestMapping(value = "/invitelist", method = RequestMethod.POST)
	@ResponseBody
	public List<MemberInviteDto> invitelist(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Integer roomcode = (Integer)session.getAttribute("roomcode");
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		String memid = request.getParameter("memid");
		MemberInviteDto memberInviteDto = new MemberInviteDto(memcode, memid, roomcode);
		List<MemberInviteDto> memberInviteList = chatService.selectInviteList(memberInviteDto);
		model.addAttribute("memberInviteList", memberInviteList);
		return memberInviteList;
	}
	@RequestMapping(value = "/invite", method = RequestMethod.POST)
	public void invite(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Integer roomcode = (Integer)session.getAttribute("roomcode");
		String[] numArray = request.getParameterValues("num");
		for(String s: numArray) {
			Integer num = Integer.parseInt(s);
			CmemberDto cmemberDto = new CmemberDto(roomcode, num);
			chatService.insertCmember(cmemberDto);
		}
	}
	@RequestMapping(value = "/invite", method = RequestMethod.GET)
	public String inviteGet(HttpSession session, HttpServletRequest request, String id, Model model) {
		return "invite";
	}
	@RequestMapping(value = "/chatlist", method = RequestMethod.POST)
	@ResponseBody
	public List<ClogListDto> chatlist(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Integer roomcode = (Integer)session.getAttribute("roomcode");
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		String sendda = request.getParameter("sendda");
		ClogDto clogDto = new ClogDto(roomcode, sendda, memcode);
		List<ClogListDto> cloglist = chatService.selectClogRoomcode(clogDto);
		return cloglist;
	}
	@RequestMapping(value = "/requestChattingCfmem", method = RequestMethod.POST)
	@ResponseBody
	public List<CroomDto> requestChattingCfmem(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		Map<String, Integer> map = new HashMap<>();
		Integer memcode = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));
		CroomDto croom = new CroomDto((String)request.getParameter("sub"), cafe, "img" );
		CroomDto croomDto = chatService.createCroom(croom, memcode);
		Integer roomcode = croomDto.getCode();
		Integer cfmem = Integer.parseInt(request.getParameter("cfmem"));
		map.put("memcode", memcode); 
		map.put("cafe", cafe);
		List<CroomDto> roomlist = chatService.getCroomList(map);
		CmemberDto cmemberDto = new CmemberDto(roomcode, cfmem);
		chatService.insertCmemberCfmem(cmemberDto);
		return roomlist;
	}
}


