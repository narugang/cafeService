package ant.tproject.cafeService.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import ant.tproject.cafeService.admin.CateMakeVO;
import ant.tproject.cafeService.admin.dao.CateMakeDao;
import ant.tproject.cafeService.admin.service.CateMakeService;
import ant.tproject.cafeService.member.authInfo.AuthInfo;
import ant.tproject.cafeService.member.controller.MemberController;

@Controller
public class CateController {

	private CateMakeDao cateMakeDao;

	private CateMakeService cateMakeService;

	public void setCateMakeService(CateMakeService cateMakeService) {
		this.cateMakeService = cateMakeService;
	}

	@Resource(name = "loginChkPath")
	private String loginChkPath;
	
	@RequestMapping(value = "/adminForm", method = RequestMethod.GET)
	public String handleAdminForm(Model model, HttpSession session) {
		if(MemberController.loginMemberCheck(session).equals(loginChkPath)) {
			return loginChkPath;
		}
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String auth = authInfo.getAuth();
		if(auth.equals("S1")) {
			List<CateMakeVO> list = cateMakeService.viewAll();
			model.addAttribute("cateMakes", list);
			return "adminForm";
		} else {
			return "redirect:/loginform";
		}
	}
	// 카테고리 생성 페이지로 이동
	@RequestMapping(value = "/cateMake", method = RequestMethod.GET)
	public String handleCateMake(Model model) {
		List<CateMakeVO> list = cateMakeService.viewAll();
		model.addAttribute("cateMakes", list);
		return "/cateMake";
	}
	@ResponseBody
	@RequestMapping(value = "/cateMake", method = RequestMethod.POST)
	public String register(CateMakeVO cateMakeVO, BindingResult bindingResult, Model model, HttpServletRequest req) {
		if (bindingResult.hasErrors()) {
			return "/cateMake";
		}
		String intername = req.getParameter("intername");
		String intercate = req.getParameter("intercate");
		if(cateMakeService.dupliInter(intername) >= 1) {
			return "0";
		}
		cateMakeVO.setIntername(intername);
		cateMakeVO.setIntercate(intercate);
		cateMakeService.register(cateMakeVO);
		List<CateMakeVO> list = cateMakeService.viewAll();
		model.addAttribute("cateMakes", list);
		return "1";
	}

}
