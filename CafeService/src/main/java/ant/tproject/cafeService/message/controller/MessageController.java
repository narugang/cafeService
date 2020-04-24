package ant.tproject.cafeService.message.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ant.tproject.cafeService.member.authInfo.AuthInfo;
import ant.tproject.cafeService.member.controller.MemberController;
import ant.tproject.cafeService.member.service.MemberService;
import ant.tproject.cafeService.message.MessageVO;
import ant.tproject.cafeService.message.service.MessageService;
import ant.tproject.cafeService.utils.PagingVO;

@Controller
public class MessageController {

	private MessageService messageService;

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	private MemberService memberService;

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Resource(name = "loginChkPath")
	private String loginChkPath;
	
	// 메시지 페이지 접속
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		return "message";
	}
	
	//관리자(S1) 쪽지 페이지 접속
	@RequestMapping(value = "/messageAdmin", method = RequestMethod.GET)
	public String messageAdmin(HttpSession session, Model model) {
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) {
			return loginChkPath;
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		if(!authInfo.getAuth().equals("S1")) {
			return loginChkPath;
		}
		model.addAttribute("authInfo", authInfo);
		return "messageAdmin";
	}
	
	//관리자 메시지 발송
	@RequestMapping(value = "/messageAdmin", method = RequestMethod.POST)
	public String messageAdmin(HttpServletRequest req, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		MessageVO messageVO = new MessageVO();
		String sender = req.getParameter("sender");
		List<Integer> target = new ArrayList<>();
		if(req.getParameter("select_Range").equals("1")) {
			target = memberService.selectMemberNum();
		} else if(req.getParameter("select_Range").equals("2")) {
			target = memberService.selectCafeLord();
		}
		int senderNum = 0;
		int targetNum = 0;
		// MultiSendMessage
		if(target.size() > 0) {
			for(int i=0; i<target.size(); i++) {
				senderNum = memberService.compareNicNum(sender);
				targetNum = target.get(i);
				messageVO.setTarget(targetNum);
				messageVO.setSender(senderNum);
				messageVO.setTitle(req.getParameter("title"));
				messageVO.setContent(req.getParameter("content"));
				messageService.insertMessage(messageVO);
			}
			return "message_Complate";
		}
		String soleTarget = req.getParameter("target");
		senderNum = memberService.compareNicNum(sender);
		targetNum = memberService.compareNicNum(soleTarget);
		messageVO.setSender(senderNum);
		messageVO.setTitle(req.getParameter("title"));
		messageVO.setContent(req.getParameter("content"));
		messageVO.setTarget(targetNum);
		messageService.insertMessage(messageVO);
		return "message_Complate";
	}
	
	// 메시지 발송
	@RequestMapping(value = "/message", method = RequestMethod.POST)
	public String message(HttpServletRequest req, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		MessageVO messageVO = new MessageVO();
		String sender = req.getParameter("sender");
		String target = req.getParameter("target");
		int senderNum = 0;
		int targetNum = 0;
		// MultiSendMessage
		if(target.length() > 3 && target.contains(",")) {
			String[] splitTarget = target.split(",");
			System.out.println(splitTarget);
			for(int i=0; i<splitTarget.length; i++) {
				targetNum = memberService.compareNicNum(splitTarget[i]);
				senderNum = memberService.compareNicNum(sender);
				messageVO.setTarget(targetNum);
				messageVO.setSender(senderNum);
				messageVO.setTitle(req.getParameter("title"));
				messageVO.setContent(req.getParameter("content"));
				messageService.insertMessage(messageVO);
			}
			return "message_Complate";
		}
		senderNum = memberService.compareNicNum(sender);// 지금 받아오는 sender와 target은 String이다.
		targetNum = memberService.compareNicNum(target);// 이것을 num로 바꾸는 구문이 필요하다. 나며지는 그냥 집어넣어서 사용하면 되겠다.
		messageVO.setSender(senderNum);
		messageVO.setTitle(req.getParameter("title"));
		messageVO.setContent(req.getParameter("content"));
		messageVO.setTarget(targetNum);
		messageService.insertMessage(messageVO);
		return "message_Complate";
	}
	
	@RequestMapping(value = "/message_Complate", method = RequestMethod.POST)
	public String complate() {

		return "message_Complate";
	}

	@RequestMapping(value = "/messageBox", method=RequestMethod.GET)
	public String messageBox() {
		
		return "messageBox";
	}
	
	//MessagePaging
	@RequestMapping(value = "/viewSendMessage", method = RequestMethod.GET)
	public String messageList(PagingVO vo, Model model,HttpServletRequest req, HttpSession session) {
		String nowPage = req.getParameter("nowPage");
		String cntPerPage = req.getParameter("cntPerPage");
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		int sender = authInfo.getNum();
		int total = messageService.countMessageSender(sender);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),sender);
		List<MessageVO>viewSendMessage = messageService.selectMessageSender(vo);
		ArrayList<String> listNic = new ArrayList<>();
		for(int i=0; i<viewSendMessage.size(); i++) {
			int targetNum = viewSendMessage.get(i).getTarget();
			String targetNic = memberService.compareNumNic(targetNum);
			listNic.add(i, targetNic);
		}
		model.addAttribute("listNic",listNic);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", messageService.selectMessageSender(vo));
		return "/viewSendMessage";
	}
	@ResponseBody
	@RequestMapping(value="/pullContext", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String pullContext(HttpServletRequest req) {
		Integer num = Integer.parseInt(req.getParameter("num"));
		return messageService.pullContext(num);
	}
	
	//MessagePaging
		@RequestMapping(value = "/receiveMessage", method = RequestMethod.GET)
		public String viewReceiveMessage(PagingVO vo, Model model
				,HttpServletRequest req, HttpSession session) {
			String nowPage = req.getParameter("nowPage");
			String cntPerPage = req.getParameter("cntPerPage");
			
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			int target = authInfo.getNum();
			System.out.println("target="+target);
			int total = messageService.countMessageTarget(target);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			vo.setTarget(target);
			System.out.println("vo="+vo);
			List<MessageVO>viewSendMessage = messageService.selectMessageTarget(vo);
			System.out.println("viewSendMessage="+viewSendMessage);
			ArrayList<String> listNic = new ArrayList<>();
			
			for(int i=0; i<viewSendMessage.size(); i++) {
				int SenderNum = viewSendMessage.get(i).getSender();
				System.out.println("SenderNum="+SenderNum);
				String SenderNic = memberService.compareNumNic(SenderNum);
				
				listNic.add(i, SenderNic);
			}
			
			model.addAttribute("listNic",listNic);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", messageService.selectMessageTarget(vo));
		
			
			return "/receiveMessage";
		}
	
}
