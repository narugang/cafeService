 package ant.tproject.cafeService.cafe.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;

import ant.tproject.cafeService.board.domain.BoardMemberNicVO;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.cafe.BfileDto;
import ant.tproject.cafeService.cafe.CafeDto;
import ant.tproject.cafeService.cafe.CategoryDto;
import ant.tproject.cafeService.cafe.CfmemberDto;
import ant.tproject.cafeService.cafe.CfmemberNicDto;
import ant.tproject.cafeService.cafe.PrepboardVO;
import ant.tproject.cafeService.cafe.service.CafeService;
import ant.tproject.cafeService.member.controller.MemberController;
import ant.tproject.cafeService.utils.UploadFileUtils;

@Controller
public class CafeController {
	private CafeService cafeService;
	public void setCafeService(CafeService cafeService) {
		this.cafeService = cafeService;
	}
	 
	//카페 시퀀스 번호로 공개 비공개여부 확인
	public boolean checkOpenCafe(Integer cafe) {
		boolean result= false;
		if(cafeService.checkOpenCafe(cafe) == 1)
			result= false;
		return result; 
	} 
	
	public Integer countCfmember(HttpSession session, HttpServletRequest request, Integer cafe, Integer num) {
		Map<String, Integer> map = new HashMap<>();
		map.put("memcode", num);
		map.put("cafecd", cafe);
		Integer countCfmember = cafeService.countCfmember(map);
		return countCfmember;
	}
	
	//카페에서의 사용자의 권환을 확인	 0은 카페지기 1은 일반 멤버
	public Integer checkAuthC1(HttpSession session, Integer cafe) {
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		Map <String, Integer> map = new HashMap<>();
		map.put("cafe", cafe);
		map.put("num", num);
		String cfmemberAuth = cafeService.selectCfmemberAuth(map);	//카페코드와 멤버 코드로 cfmember의 auth를 가져온다.
		if(cfmemberAuth == null||!cfmemberAuth.equals("C1"))
			return 1;
		return 0;
	}
	//==============================================================================================================
	@Resource(name = "loginChkPath")
	private String loginChkPath;
	private int[] searchType = {0, 1, 2, 3}; //0:모든 게시글, 1: 카테고리별, 2:제목과 내용으로 검색. 3:카페멤버 모든글
	//해당 카페의 홈페이지로 이동
		@RequestMapping(value = "/cafehome", method = RequestMethod.GET)
		public String cafeHome(HttpSession session,HttpServletRequest request, Model model) throws JsonProcessingException{
			String check = MemberController.loginMemberCheck(session);
			if(check.equals(loginChkPath)) {
				return loginChkPath;
			}		

			Map<String, Integer> map = new HashMap<String, Integer>();
			Integer num = Integer.parseInt(check);
			Integer cafe = Integer.parseInt(request.getParameter("seq")); //숫자부분에 카페시퀀스 삽입
			CafeDto cafeDto = cafeService.selectCafe(cafe);
			Integer	countCfmember = countCfmember(session, request,cafe,num);
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cfmemberAuth", cfmemberAuth);
			model.addAttribute("cafe",cafeDto);
			model.addAttribute("countCfmem", countCfmember);
			
			//방문수,조회수
			int seq = cafeDto.getSeq();
			try {
				cafeService.updateCnt(seq);
				cafeService.updateViewCnt(seq);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "cafehome";
		}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(HttpSession session, HttpServletRequest request, Model model) throws JsonProcessingException {
		
		String check = MemberController.loginMemberCheck(session);
		if(check.equals(loginChkPath)) {
			return loginChkPath;
		}
		
		Integer cafe = Integer.parseInt(request.getParameter("seq")); //cafe 넘버
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer countCfmember = countCfmember(session, request, cafe, num);
		CafeDto cafeDto = cafeService.selectCafe(cafe);
		Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
		model.addAttribute("cafe", cafeDto);
		model.addAttribute("cfmemberAuth", cfmemberAuth);
		model.addAttribute("countCfmem", countCfmember);
		return "calendar";
	}  
	
	@RequestMapping(value = "/cafemember", method = RequestMethod.GET)
	public String cafeMember(HttpSession session,HttpServletRequest request, Model model) throws JsonProcessingException{
		String check = MemberController.loginMemberCheck(session);
		if(check.equals(loginChkPath)) {
			return loginChkPath;
		}
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer cafe = Integer.parseInt(request.getParameter("seq")); //숫자부분에 카페시퀀스 삽입
		CafeDto cafeDto = cafeService.selectCafe(cafe);
		Integer	countCfmember = countCfmember(session, request,cafe,num);
		Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
		List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
		model.addAttribute("cafe",cafeDto);
		model.addAttribute("countCfmem", countCfmember);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cfmemberAuth", cfmemberAuth);
		return "cafemember";
	}
	//게시글 작성(글쓰기) 1은 부적절한 요청, 0은 성공
	@RequestMapping(value = "/writePost", method = RequestMethod.POST)
	@ResponseBody
	public Integer writePost(MultipartHttpServletRequest request, HttpSession session) {	//cafehome.jsp에서 글쓰기 ajax요청	
		Map<String, Integer> map = new HashMap<String, Integer>();
		Integer writernum = Integer.parseInt(MemberController.loginMemberCheck(session));
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));
		map.put("memcode", writernum);
		map.put("cafecd", cafe);
		if(cafeService.countCfmember(map) != 1)
			return 1;
		cafeService.insertPost(request, writernum);
		return 0; 
	}
	//카페 가입하기 1은 부적절한 가입신청, 0은 가입성공
	@RequestMapping(value = "/joinCafe", method = RequestMethod.POST)
	@ResponseBody
	public Integer joinCafe(HttpServletRequest request, HttpSession session) {
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));
		if(checkOpenCafe(cafe))
			return 1;
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session)); 
		CfmemberDto cfmemberDto = new CfmemberDto(num, cafe, 1);
		cafeService.insertCfmember(cfmemberDto);
		return 0;
	}
	
	// 카페명 중복확인
	@ResponseBody
	@RequestMapping(value = "/titleCheck", method = RequestMethod.POST)
	public String titleCheck(HttpServletRequest req) {

		String title = (String)req.getParameter("title");
		System.out.println("title="+title);

		int result = cafeService.titleCheck(title);

		System.out.println(result + " : 3");

		return Integer.toString(result);
	}	

	//카테고리 별로 게시글 불러오기
		@RequestMapping(value = "/loadPost", method = RequestMethod.POST)
		public String loadPost(HttpServletRequest request, HttpSession session, Model model) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			Integer postLoadCnt = Integer.parseInt(request.getParameter("postLoadCnt"));	//불러온 글의 갯수
			Integer increase = Integer.parseInt(request.getParameter("increase"));		//불러올 글의 갯수
			Integer category = Integer.parseInt(request.getParameter("category"));		//카테고리
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));		//카페
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			String nic = cafeService.compareNumNic(num);
			Integer cfmemberAuth = checkAuthC1(session,cafe);
			map.put("postLoadCnt", postLoadCnt);
			map.put("increase", increase);
			map.put("category", category);
			List<BoardMemberNicVO> result;
			model.addAttribute("postLoadCnt", postLoadCnt);
			model.addAttribute("searchType", searchType[1]);
			model.addAttribute("nic", nic);
			model.addAttribute("cfmemberAuth", cfmemberAuth);
			if(postLoadCnt == 0) { 	//처음에 게시글이 없을때 게시물을 불러온다.
				result=cafeService.loadPostZero(map);
				model.addAttribute("postList", result);
			}else { 
				result=cafeService.loadPost(map);
				model.addAttribute("postList", result);
			}
			return "cafePost";
		}
		
		//카페의 모든 게시글 불러오기
		@RequestMapping(value = "/loadPostAll", method = RequestMethod.POST)
		public String loadPostAll(HttpServletRequest request, HttpSession session, Model model) {	
			Map<String, Integer> map = new HashMap<String, Integer>();
			Integer postLoadCnt = Integer.parseInt(request.getParameter("postLoadCnt"));	//불러온 글의 갯수
			Integer increase = Integer.parseInt(request.getParameter("increase"));		//불러올 글의 갯수
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));		//카페
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			String nic = cafeService.compareNumNic(num);
			Integer cfmemberAuth = checkAuthC1(session,cafe);
			map.put("postLoadCnt", postLoadCnt);
			map.put("increase", increase);
			map.put("cafe", cafe);
			List<BoardMemberNicVO> result;
			model.addAttribute("searchType", searchType[0]);
			model.addAttribute("postLoadCnt", postLoadCnt);
			model.addAttribute("nic", nic);
			model.addAttribute("cfmemberAuth", cfmemberAuth);
			if(postLoadCnt == 0) {	//처음에 게시글이 없을때 게시물을 불러온다.
				result=cafeService.loadPostAllZero(map);
				model.addAttribute("postList", result);
			}else {
				result=cafeService.loadPostAll(map);
				model.addAttribute("postList", result);
			}
			return "cafePost";
		}
	
	//게시글 코드로 파일 정보 불러오기
	@RequestMapping(value = "/loadPostFile", method = RequestMethod.POST)
	@ResponseBody
	public List<BfileDto> loadPostFile(HttpServletRequest request, HttpSession session) {	//cafehome.jsp에서 글쓰기 ajax요청	
		Integer postcd = Integer.parseInt(request.getParameter("postcd"));
		return cafeService.loadPostFile(postcd);
	}
	//파일 저장위치
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//게시글 첨부파일 다운로드
	@RequestMapping(value = "/downloadPostFile", method = RequestMethod.GET)
	public void downloadPostFile(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {	//cafehome.jsp에서 글쓰기 ajax요청	
		Integer idx = Integer.parseInt(request.getParameter("idx"));
		String postUploadPath = uploadPath+File.separator+"postUpload";	//저장경로
		BfileDto bfileDto = cafeService.selectBFileForIdx(idx);
		UploadFileUtils.downloadFile(postUploadPath, bfileDto, request, response);
	}
	//멤버정보 불러오기
	@RequestMapping(value = "/loadCfmember", method = RequestMethod.POST)
	public String loadCfmember(HttpServletRequest request, HttpSession session, Model model) {	//cafehome.jsp에서 글쓰기 ajax요청	
		Map<String, Integer> map = new HashMap<String, Integer>();
		Integer postLoadCnt = Integer.parseInt(request.getParameter("postLoadCnt"));	//불러온 글의 갯수
		Integer increase = Integer.parseInt(request.getParameter("increase"));		//불러올 글의 갯수
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));		//카테고리
		String sortMember = request.getParameter("sortMember");		//정렬기준
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		String nic = cafeService.compareNumNic(num);
		map.put("postLoadCnt", postLoadCnt);
		map.put("increase", increase);
		map.put("cafe", cafe);
		List<CfmemberNicDto> result;
		model.addAttribute("nic", nic);
		if(sortMember.equals("ASC")) {	//불러온 멤버정보가 없을 때 실행
			result = postLoadCnt == 0?cafeService.loadCfmemberZeroASC(map):cafeService.loadCfmemberASC(map);
			model.addAttribute("cfmemberList", result);
			for(CfmemberNicDto cfm : result) {
				System.out.println(cfm.toString());
			}
			return "cafeMemberCard";
		}
		result = postLoadCnt == 0?cafeService.loadCfmemberZeroDESC(map):cafeService.loadCfmemberDESC(map);
		model.addAttribute("cfmemberList", result);
		for(CfmemberNicDto cfm : result) {
			System.out.println(cfm.toString());
		}
		return "cafeMemberCard";
	}
	//멤버정보 불러오기
		@RequestMapping(value = "/searchCfmember", method = RequestMethod.POST)
		public String searchCfmember(HttpServletRequest request, HttpSession session, Model model) {	//cafehome.jsp에서 글쓰기 ajax요청	
			Map<String, String> map = new HashMap<>();
			String postLoadCnt = request.getParameter("postLoadCnt");	//불러온 글의 갯수
			String increase = request.getParameter("increase");		//불러올 글의 갯수
			String cafe = request.getParameter("cafe");		//카테고리
			String sortMember = request.getParameter("sortMember");		//정렬기준
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			String nic = cafeService.compareNumNic(num);
			String searchtext = request.getParameter("searchtext");
			map.put("postLoadCnt", postLoadCnt);
			map.put("increase", increase);
			map.put("cafe", cafe);
			map.put("searchtext", searchtext);
			List<CfmemberNicDto> result;
			model.addAttribute("nic", nic);
			if(sortMember.equals("ASC")) {	//불러온 멤버정보가 없을 때 실행
				result = postLoadCnt.equals("0")?cafeService.searchCfmemberZeroASC(map):cafeService.searchCfmemberASC(map);
				model.addAttribute("cfmemberList", result);
				for(CfmemberNicDto cfm : result) {
					System.out.println(cfm.toString());
				}
				return "cafeMemberCard";
			}
			result = postLoadCnt.equals("0")?cafeService.searchCfmemberZeroDESC(map):cafeService.searchCfmemberDESC(map);
			model.addAttribute("cfmemberList", result);
			for(CfmemberNicDto cfm : result) {
				System.out.println(cfm.toString());
			}
			return "cafeMemberCard";
		}
	//검색을 위한  cafesearch페이지로 이동
		@RequestMapping(value = "/cafesearchCfmem", method = RequestMethod.GET)
		public String searchPostCfmem(HttpServletRequest request, HttpSession session, Model model) {		
			String num = MemberController.loginMemberCheck(session);	//세션의 인증정보를 확인 맞으면 멤버 코드
			if(num.equals(loginChkPath))	
				return loginChkPath;	//servlet-context에 설정해놓은 매핑값으로 이동
			Integer cfmem = Integer.parseInt(request.getParameter("cfmem"));		//검색할 카페멤버 코드
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));  //카페시퀀스 번호
			CafeDto cafeDto = cafeService.selectCafe(cafe);		//카페정보
			Integer	countCfmember = countCfmember(session, request,cafe,Integer.parseInt(num));	//가입여부 확인
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cfmemberAuth", cfmemberAuth);
			model.addAttribute("cfmem", cfmem);
			model.addAttribute("cafe",cafeDto);
			model.addAttribute("countCfmem", countCfmember);
			model.addAttribute("searchType", searchType[3]);
			return "cafesearch";
		}
		
	//카페멤버코드를 기준으로 전체글에서 검색
	@RequestMapping(value = "/searchPostCfmemList", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardMemberNicVO> searchPostCfmemList(HttpServletRequest request, HttpSession session, Model model) {	//cafehome.jsp에서 글쓰기 ajax요청	
		Map<String, Integer> map = new HashMap<>();
		Integer postLoadCnt = Integer.parseInt(request.getParameter("postLoadCnt"));	//불러온 글의 갯수
		Integer increase = Integer.parseInt(request.getParameter("increase"));		//불러올 글의 갯수
		Integer category = Integer.parseInt(request.getParameter("category"));		//카테고리
		Integer cfmem = Integer.parseInt(request.getParameter("cfmem"));		//검색할 카페멤버 코드
		map.put("postLoadCnt", postLoadCnt);
		map.put("increase", increase);
		map.put("category", category);
		map.put("cfmem", cfmem);
		if(postLoadCnt == 0) {	//처음에 게시글이 없을때 게시물을 불러온다.
			return cafeService.searchPostCfmemZero(map);
		}
		return cafeService.searchPostCfmem(map);
	}
	//검색을 위한  cafesearch페이지로 이동
	@RequestMapping(value = "/cafesearchSubContent", method = RequestMethod.GET)
	public String searchPostSubContent(HttpServletRequest request, HttpSession session, Model model) {		
		String num = MemberController.loginMemberCheck(session);	//세션의 인증정보를 확인 맞으면 멤버 코드
		if(num.equals(loginChkPath))	
			return loginChkPath;	//servlet-context에 설정해놓은 매핑값으로 이동
		String searchtext = request.getParameter("searchtext");		//검색할 텍스트
		Integer cafe = Integer.parseInt(request.getParameter("seq"));  //카페시퀀스 번호
		CafeDto cafeDto = cafeService.selectCafe(cafe);		//카페정보
		Integer	countCfmember = countCfmember(session, request,cafe,Integer.parseInt(num));	//가입여부 확인
		Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
		List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cfmemberAuth", cfmemberAuth);
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("cafe",cafeDto);
		model.addAttribute("countCfmem", countCfmember);
		model.addAttribute("searchType", searchType[2]);	//검색유형 
		return "cafesearch";
	}
	//제목과 내용으로 전체글에서 검색
	@RequestMapping(value = "/searchPostSubContentList", method = RequestMethod.POST) 
	public String searchPostSubContentList(HttpServletRequest request, HttpSession session, Model model) {	//cafehome.jsp에서 글쓰기 ajax요청	
		Map<String, String> map = new HashMap<>();
		String postLoadCnt = request.getParameter("postLoadCnt");	//불러온 글의 갯수
		String increase = request.getParameter("increase");		//불러올 글의 갯수
		String cafe = request.getParameter("cafe");		//카테고리 쿼리문에서 TO_NUMBER
		String postsub = request.getParameter("searchtext");		//검색할 제목
		String content = request.getParameter("searchtext");		//검색할 내용
		map.put("postLoadCnt", postLoadCnt);
		System.out.println("plc: "+postLoadCnt);
		map.put("increase", increase);
		map.put("cafe", cafe);
		map.put("postsub", postsub);
		map.put("content", content);
		List<BoardMemberNicVO> result; 
		if(postLoadCnt.equals("0")) {	//처음에 게시글이 없을때 게시물을 불러온다.
			result = cafeService.searchPostSubContentZero(map);
			model.addAttribute("postList", result);
		}else {
			result = cafeService.searchPostSubContent(map);
			model.addAttribute("postList", result);
		}
		
		return "cafePost";
	}
	
	//카테고리 생성하기 1이면 관한없는 접근 0이면 요청완료
		@RequestMapping(value = "/insertCategory", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertCategory(HttpServletRequest request, HttpSession session) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			if(cfmemberAuth != 0)
				return 1;
			String name = request.getParameter("name");
			CategoryDto categoryDto = new CategoryDto(name, cafe);
			cafeService.insertCategory(categoryDto);
			return 0;
		}
	
		//관리자 페이지로 이동
		@RequestMapping(value = "/cafeAdminPage", method = RequestMethod.POST)
		public String cafeAdminPage(HttpServletRequest request, HttpSession session, Model model) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			if(cfmemberAuth == 1)
				return "cafehome";
			List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
			List<PrepboardVO> prepboard = cafeService.selectPrepBoard(cafe);
			model.addAttribute("prepboard", prepboard);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cafe", cafe);
			return "cafeadmin";
		}
		
		//카테고리 수정하기 1이면 관한없는 접근 0이면 요청완료
		@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateCategory(HttpServletRequest request, HttpSession session) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			if(cfmemberAuth != 0)
				return 1;
			String[] name = request.getParameterValues("name");
			String[] code = request.getParameterValues("code");
			cafeService.updateCategory(code, name);
			return 0;
		}
		
		//카테고리 삭제하기 1이면 관한없는 접근 0이면 요청완료
		@RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteCategory(HttpServletRequest request, HttpSession session) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer cfmemberAuth = checkAuthC1(session, cafe);	//카페지기인지 체크
			if(cfmemberAuth != 0)
				return 1;
			Map<String, String[]> map = new HashMap<>();
			String[] code = request.getParameterValues("code");
			map.put("code", code);
			cafeService.deleteCategory(map);
			return 0;
		}	
		@RequestMapping(value = "/updatePostForm", method = RequestMethod.POST)
		public String updatePostForm(HttpServletRequest request, HttpSession session, Model model) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer code = Integer.parseInt(request.getParameter("postcd"));
			List<CategoryDto> categoryList = cafeService.selectCategory(cafe);
			BoardVO post = cafeService.selectPostCode(code);
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			Integer cfmemberAuth = checkAuthC1(session,cafe);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("post", post);
			if(num == post.getWriternum() || cfmemberAuth == 0)
				return "updatepost";
			return "잘못된 접근입니다.";
		}
		@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
		@ResponseBody
		public int updatePost(HttpServletRequest request, HttpSession session, Model model) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			Integer cfmemberAuth = checkAuthC1(session,cafe);
			Integer code = Integer.parseInt(request.getParameter("code"));
			BoardVO post = cafeService.selectPostCode(code);
			String postsub = request.getParameter("postsub");
			Integer category = Integer.parseInt(request.getParameter("category"));
			String content = request.getParameter("content");
			BoardVO postDto = new BoardVO(code, postsub, content, category);
			if(num == post.getWriternum() || cfmemberAuth == 0) {
				cafeService.updatePost(postDto);
				return 1;
			}
			return 0;
		}
		@RequestMapping(value = "/deletePost", method = RequestMethod.POST)
		@ResponseBody
		public int deletePost(HttpServletRequest request, HttpSession session, Model model) {
			Integer cafe = Integer.parseInt(request.getParameter("cafe"));
			Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
			Integer cfmemberAuth = checkAuthC1(session,cafe);
			Integer code = Integer.parseInt(request.getParameter("code"));
			BoardVO post = cafeService.selectPostCode(code);
			if(num == post.getWriternum() || cfmemberAuth == 0) {
				cafeService.deletePost(code);
				return 1;
			}
			return 0;
		}

		//게시물 신고
		@RequestMapping(value="/boardPrepPage",method= RequestMethod.GET)
		public String boardPrepPage(HttpSession session, HttpServletRequest req, Model model) {
			//게시글 번호를 입력 받아서 넘겨준다.
			String code = req.getParameter("code");
			model.addAttribute("code", code);
			return "/boardPrepPage";
		}

		//게시물 신고
		@RequestMapping(value="/boardPrepPage",method= RequestMethod.POST)
		public String sendPrepContent(HttpSession session, HttpServletRequest req, Model model) {
			int code = Integer.parseInt(req.getParameter("boardCode")); //게시글 코드
			String prepReason = req.getParameter("prepReason"); // 사유
			String prepContent = req.getParameter("prepcontext"); // 내용
			PrepboardVO prepboardVO = new PrepboardVO();
			prepboardVO.setPostnum(code);
			prepboardVO.setPrepreason(prepReason);
			prepboardVO.setPrepcontext(prepContent);
			cafeService.prepboard(prepboardVO);
			model.addAttribute("check", "check");
			return "/boardPrepPage";
		}
		
}
 