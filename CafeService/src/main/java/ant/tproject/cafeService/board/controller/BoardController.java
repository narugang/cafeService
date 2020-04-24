package ant.tproject.cafeService.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import ant.tproject.cafeService.board.domain.PageMaker;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.board.service.BoardService;
import ant.tproject.cafeService.member.controller.MemberController;

@Controller
@SessionAttributes("boardVO")
public class BoardController {
	private BoardService boardService;

	public void setBoardService(BoardService boardService){
		this.boardService = boardService;
	}

	@Resource(name = "loginChkPath")
	private String loginChkPath;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		String check = MemberController.loginMemberCheck(session);
		if(check.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute("list", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "list";
		
	}
	
	@RequestMapping(value = "/searchall", method = RequestMethod.GET)
	public String searchall(HttpSession session, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		String check = MemberController.loginMemberCheck(session);
		if(check.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute("list", boardService.list(scri));
		model.addAttribute("blist", boardService.blist(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		pageMaker.setTotalCount(boardService.blistCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "searchall";
		
	}
	
	@RequestMapping(value = "/bandend", method = RequestMethod.GET)
	public String endlist(HttpSession session) throws Exception{
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) 
			return loginChkPath;
		
		return "bandend";
	}
	

	@RequestMapping(value = "/bandguide1", method = RequestMethod.GET)
	public String bandguide1(HttpSession session) throws Exception{
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) 
			return loginChkPath;
		return "/bandguide1";
	}
	
	@RequestMapping(value = "/bandguide2", method = RequestMethod.GET)
	public String bandguide2(HttpSession session) throws Exception{
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) 
			return loginChkPath;
		return "/bandguide2";
	}
	
	@RequestMapping(value = "/bandguide3", method = RequestMethod.GET)
	public String bandguide3(HttpSession session) throws Exception{
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) 
			return loginChkPath;
		return "/bandguide3";
	}
	
	@RequestMapping(value = "/bandguide4", method = RequestMethod.GET)
	public String bandguide4(HttpSession session) throws Exception{
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) 
			return loginChkPath;
		return "/bandguide4";
	}
	

}
