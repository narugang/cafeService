package ant.tproject.cafeService.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import ant.tproject.cafeService.admin.CateMakeVO;
import ant.tproject.cafeService.admin.service.CateMakeService;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.board.domain.PageMaker;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.board.service.BoardService;
import ant.tproject.cafeService.cafe.CafeDto;
import ant.tproject.cafeService.member.authInfo.AuthInfo;
import ant.tproject.cafeService.member.controller.MemberController;
import ant.tproject.cafeService.member.service.MemberService;
import ant.tproject.cafeService.utils.UploadFileUtils;

@Controller
/* @SessionAttributes("boardVO") */
public class BoardControllerbandmain {

	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	// 카테고리
	private CateMakeService cateMakeService;

	public void setCateMakeService(CateMakeService cateMakeService) {
		this.cateMakeService = cateMakeService;
	}
	@Resource(name = "loginChkPath")
	private String loginChkPath;
	
	// bandmain 접속
	@RequestMapping(value = "/bandmain", method = RequestMethod.GET)
	public String list(HttpSession session, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		String check = MemberController.loginMemberCheck(session);
		if(check.equals(loginChkPath)) {
			return loginChkPath;
		}
		model.addAttribute("list", boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		model.addAttribute("blist", boardService.blist(scri));
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.blistCount(scri));

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		int num = authInfo.getNum();
		
		scri.setNum(num);
		model.addAttribute("myblist", boardService.myblist(scri));
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.myblistCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "bandmain";
	}

	@RequestMapping(value = "/blist", method = RequestMethod.GET)
	public String blist(HttpSession session, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		String num = MemberController.loginMemberCheck(session);
		if(num.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute("blist", boardService.blist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.blistCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "blist";

	}

	@RequestMapping(value = "/bandsearch", method = RequestMethod.GET)
	public String search(HttpSession session,Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		String num = MemberController.loginMemberCheck(session);
		if(num.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute("list", boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));

		model.addAttribute("blist", boardService.blist(scri));
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.blistCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bandsearch";

	}

	// 새 글 작성을 위한 요청을 처리
	@RequestMapping(value = "/bandwrite", method = RequestMethod.GET)
	public String bwrite(HttpSession session, Model model) {
		String num = MemberController.loginMemberCheck(session);
		if(num.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute("boardVO", new BoardVO());
		return "bandwrite";
	}

	// 새 글 등록을 위한 요청을 처리
	@RequestMapping(value = "/bandwrite", method = RequestMethod.POST)
	public String bwrite(@Valid CafeDto cafeDto, BindingResult bindingResult) {
		/*
		 * if(bindingResult.hasErrors()){
		 * 
		 * System.out.println("bind에러");
		 * 
		 * return "/band/bandwrite"; }
		 */
		boardService.bwrite(cafeDto);
		return "redirect:bandmain";
	}

	// createband3
	@RequestMapping(value = "/createband3", method = RequestMethod.GET)
	public String c3(HttpSession session, Model model) throws Exception {

		String num = MemberController.loginMemberCheck(session);
		if(num.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		List<CateMakeVO> list = cateMakeService.viewAll();
		System.out.println("list:" + list);
		model.addAttribute("cateMakes", list); // 카테고리 내용을 출력해서 보여줌

		return "/createband3";

	}

	// 파일 업로드 추가 사항
	@Resource(name = "uploadPath")
	private String uploadPath;

	// createband4
	@RequestMapping(value = "/createband4", method = RequestMethod.GET)
	public String bbwrite(CafeDto cafeDto, Model model, HttpServletRequest req,
			HttpSession session) {
		String num = MemberController.loginMemberCheck(session);
		if(num.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		model.addAttribute(cafeDto);

		// 관심사 받아오는 구문
		String ss = req.getParameter("inte");
		System.out.println("ss=" + ss);

		String result = "";
		String[] inte = req.getParameterValues("inte");
		for (String s : inte) {
			result += (s + ",");
			System.out.println("result: " + result);
		}
		int leng = result.length();
		System.out.println("leng" + leng);
		// 여러개 받을떄 콤마 제거
		if (leng > 0) {
			System.out.println("if");
			result = result.substring(0, leng - 1);
		}
		System.out.println(result); // 1,2 찍히고

		model.addAttribute("intere", result);
		
		////관심사 카테고리 한글
		String sss = req.getParameter("inte");
		System.out.println("sss=" + sss);
		
		String result1 = "";
	
		String[] interName = req.getParameterValues("intName");
		ArrayList<String> iNames = new ArrayList<String>();
		
		System.out.println(" interName = " +  interName);
		
		
		for(int i = 0; i < inte.length; i++) {
			for(int j = 0; j < interName.length; j++) {
				System.out.println("inte:" + inte[i]);
				if(inte[i].equals(String.valueOf(j+1))) {
					System.out.println("interName:" + interName[j]);
					iNames.add(interName[j]);
					break;
				}
			}
		}
		System.out.println("결과값  = " + iNames); // 1,2 찍히고
		model.addAttribute("interName", iNames);
		//
		return "createband4";
	}

	
	
	// 새 글 등록을 위한 요청을 처리
	@RequestMapping(value = "/createband4", method = RequestMethod.POST)
	public String bbwrite(@Valid CafeDto cafeDto, BindingResult bindingResult, MultipartFile file)
			throws IOException, Exception {

		// image 업로드
		System.out.println("카페생성 시 file insert를 위해 불러오는 file 이름=" + file);

		// 파일 업로드 폼 S
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") { // 파일이 null이 아니고 공백도 아닐 경우
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			cafeDto.setImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		} else { // defualt 이미지를 여기서 가져오는데...

			// fileName = uploadPath + File.separator + "images" + File.separator +
			// "default.jpg"; // D:/images/default.jpg
			fileName = File.separator + "images" + File.separator + "default.jpg";
			cafeDto.setImage(fileName);

		}
		// 파일 업로드 폼 S

		if (bindingResult.hasErrors()) {
			return "/regform";
		}

		//카페 생성
		boardService.bwrite(cafeDto);
		//게시판 카테고리 생성(자유게시판)
		boardService.gorywrite();
		
		return "redirect:bandend";
	}

	@RequestMapping(value = "/searchband", method = RequestMethod.GET)
	public String searchband(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("list", boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "searchband";

	}

	// 나의가입 카페 목록
	@RequestMapping(value = "/myblist", method = RequestMethod.GET)
	public String myblist(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session)
			throws Exception {
		
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		int num = authInfo.getNum();
		System.out.println("num=" + num);

		scri.setNum(num);
		model.addAttribute("myblist", boardService.myblist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.myblistCount(scri));

		System.out.println("model" + model);

		model.addAttribute("pageMaker", pageMaker);

		return "myblist";

	}
	//
}
