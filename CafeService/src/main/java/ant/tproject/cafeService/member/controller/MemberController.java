package ant.tproject.cafeService.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ant.tproject.cafeService.admin.CateMakeVO;
import ant.tproject.cafeService.admin.service.CateMakeService;
import ant.tproject.cafeService.member.MemberVO;
import ant.tproject.cafeService.member.authInfo.AuthInfo;
import ant.tproject.cafeService.member.dao.MemberDao;
import ant.tproject.cafeService.member.service.MailService;
import ant.tproject.cafeService.member.service.MemberService;
import ant.tproject.cafeService.utils.UploadFileUtils;

@Controller
public class MemberController {

	private MemberDao memberDao;

	private MemberService memberService;
	
	private CateMakeService cateMakeService;

	MailService mailService;

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	public void setCateMakeService(CateMakeService cateMakeService) {
		this.cateMakeService = cateMakeService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//회원 로그인 check
	public static String loginMemberCheck(HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String num = "redirect:/loginform";
		if(authInfo == null)
			return num;
		if(authInfo != null) {
			num = Integer.toString(authInfo.getNum());
		} 
			return num;
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String cateChangeView(Model model,HttpSession session) {
	
		List<CateMakeVO> list = cateMakeService.viewAll();
		model.addAttribute("cateMakes", list);

		return "/myPage";
	}
	
	// 파일 업로드 추가 사항
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/main",method = RequestMethod.GET)
	public String handleMain(HttpSession session) {
		String loginMemberCheck = loginMemberCheck(session);
		if(loginMemberCheck.equals("/loginform")) 
			return "redirect:"+loginMemberCheck;
		return "/main";
	}

	// 폼으로 접근할 때
	@RequestMapping(value = "/regform", method = RequestMethod.GET)
	public String regForm(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		List<CateMakeVO> list = cateMakeService.viewAll();
		model.addAttribute("cateMakes", list); // 카테고리 내용을 출력해서 보여줌
		return "/regform";
	}

	// 폼에서 submit을 할 때
	@RequestMapping(value = "/regform", method = RequestMethod.POST)
	public String register(MemberVO memberVO, MultipartFile file, BindingResult bindingResult) throws Exception {
		//Pwd해싱을 위한 코드_S
		String pwd = BCrypt.hashpw(memberVO.getPwd(), BCrypt.gensalt());
		memberVO.setPwd(pwd);
		//Pwd해싱을 위한 코드_E
		//파일 업로드 폼 S
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") { // 파일이 null이 아니고 공백도 아닐 경우
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			memberVO.setFileImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			memberVO.setThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else { //defualt 이미지를 여기서 가져오는데...
			fileName = File.separator + "images" + File.separator + "default.jpg";
			memberVO.setFileImg(fileName);
			memberVO.setThumbImg(fileName);
		}
		//파일 업로드 폼 S
		if (bindingResult.hasErrors()) {
			return "/regform";
		}
		String userAuth = "M1";
		memberVO.setAuth(userAuth);
		memberService.register(memberVO);
		return "redirect:/loginform";
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest req) {
		String id = (String) req.getParameter("id");
		int result = memberService.idCheck(id);
		return Integer.toString(result);
	}

	// 닉네임 중복확인
	@ResponseBody
	@RequestMapping(value = "/nicCheck", method = RequestMethod.POST)
	public String nicCheck(HttpServletRequest req) {
		if (req.getParameter("nic").equals("")) {
			int result = 1;
			return Integer.toString(result);
		} else {
			String nic = (String) req.getParameter("nic");
			int result = memberService.nicCheck(nic);
			return Integer.toString(result);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		//loginForm에서 JS : ajax에 넘기기 위한 해싱 값 도출 // hashing을 위한 코드_S
		MemberVO result1 = memberService.selectById(id);
		if(id.equals("admin")) {
			HashMap<String, String> admin = new HashMap<String, String>(); 
			admin.put("id", id);
			admin.put("pwd", pwd);
			memberService.loginCheck(admin);
			return "1";
		}
		if(BCrypt.checkpw(pwd, result1.getPwd())) {
			return "1";
		} else {
			return "0";
		}
	}
	
	
	
	@RequestMapping(value = "/findInfo", method = RequestMethod.GET)
	public String findInfo() {
		return "/findInfo";
	}

	@ResponseBody
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId(HttpServletRequest req) {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		HashMap<String, String> findId = new HashMap<String, String>();
		findId.put("name", name);
		findId.put("email", email);
		String result = memberService.findId(findId);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	public String findPwd(HttpServletRequest req) {
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		MemberVO checkUser = memberService.selectById(id);
		boolean checkEmail = checkUser.getEmail().equals(email);
		if(id != null && email != null) {
			if(checkEmail) {	
				//임시 비밀번호 발급 및 이메일 전송을 위한 코드_S
				int ran = new Random().nextInt(900000) + 100000; // 메일로 발송 할 랜덤 함수 생성
				String authCode = String.valueOf(ran);
				String subject = "임시 비밀번호 발급 입니다. 보안을 위해 빠른 시일 안에 변경해주세요";
				StringBuilder sb = new StringBuilder();
				sb.append("귀하의 인증 코드는 [" + authCode + "] 입니다.");
				//임시 비밀번호 발급 및 이메일 전송을 위한 코드_E
				
				//발송 한 임시 비밀번호를 DB에 저장_S
				HashMap<String, String> changePwd = new HashMap<String, String>();
				changePwd.put("id", id);
				// 임시 비밀번호도 해싱해서 저장
				changePwd.put("pwd", BCrypt.hashpw(authCode, BCrypt.gensalt()));
				memberService.changePwd(changePwd);
				//발송 한 임시 비밀번호를 DB에 저장_E
				//메일 발송
				mailService.send(subject, sb.toString(), email, null);
				return "1";
			} else {
				return "0";
			}
		}
		return "2";
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int emailCheck(HttpServletRequest req) {

		int result = 0;

		if (!req.getParameter("email").equals("")) {
			String email = (String) req.getParameter("email");
			result = memberService.emailCheck(email);

		} else if (req.getParameter("email").equals("")) {
			result = -1;
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/changePwd", method=RequestMethod.POST)
	public String changePwd(HttpServletRequest req, HttpSession session) {
		AuthInfo authinfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authinfo.getId();
		String authPwd = authinfo.getPwd();
		String pwd = req.getParameter("pwd");
		//Pwd해싱을 위한 코드_S
		pwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
		//Pwd해싱을 위한 코드_E
		HashMap<String, String> changePwd = new HashMap<>();
		changePwd.put("id", id);
		changePwd.put("pwd", pwd);
		if(authPwd.equals(pwd)) {
			return "-1";
		} else {
			memberService.changePwd(changePwd);
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/changeInter", method=RequestMethod.POST)
	public String changeInter(HttpServletRequest req, HttpSession session,
			@RequestParam(value="inter") List<String> interest) {
		//변경 될 관심사도 가져와야 한다.
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo"); 
		String id =	authInfo.getId();
		String inter = "";
		int i = 0;
		for(i = 0; i < interest.size(); i++) {
			inter += interest.get(i)+",";
		}
		inter = inter.substring(0, inter.length()-1);
		HashMap<String, Object> changeInter = new HashMap<String, Object>();
		changeInter.put("id", id);
		changeInter.put("inter", inter);
		String currentInter = authInfo.getInter();
		if(!inter.equals(currentInter)) {
			memberService.changeInter(changeInter);
			return "1";
		} else {
			return "0";
		}
	}
	
	//내 관심사 가져오기 ( view )
	@ResponseBody
	@RequestMapping(value = "/viewInter", method = RequestMethod.POST)
	public String[] selectInter(HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		String id = authInfo.getId();
		String result = memberService.selectInter(id);
		String[] result1 = result.split(",");
		String[] names = new String[result1.length];

		for(int i=0;i<result1.length;i++) {
			names[i] = memberService.selectInterName(Integer.parseInt(result1[i]));
		}
		return names;
	}
	//자기소개 가져오기
	@ResponseBody
	@RequestMapping(value="/selectIntro",method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String selectIntro(HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		String result = memberService.selectIntro(id);
		return result;
	}
	
	//자기소개 변경
	@ResponseBody
	@RequestMapping(value="/changeIntro", method = RequestMethod.POST)
	public String changeIntro(HttpServletRequest req, HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		String newIntro = req.getParameter("newIntro");
		
		HashMap<String, String> changeIntro = new HashMap<String, String>();
		changeIntro.put("id", id);
		changeIntro.put("intro", newIntro);
		
		if(id != "" && newIntro != "") {
			memberService.changeIntro(changeIntro);
			return "1";

		} else {
			return "0";
		}
	}
	
	//주소 가져오기
	@ResponseBody
	@RequestMapping(value="/selectAddres",method=RequestMethod.POST, produces = "application/text; charset=utf8") //, produces = "application/text; charset=utf8"
	public String selectAddres(HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		HashMap<String, String> result = memberService.selectAddres(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonStr;
	}
	
	//주소 업데이트
	@ResponseBody
	@RequestMapping(value="/changeAddress",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String changeAddress(HttpServletRequest req, HttpSession session) {
		
		String postcode = req.getParameter("postcode");
		String adres = req.getParameter("adres");
		String detailadres = req.getParameter("detailadres");
		String extraadres = req.getParameter("extraadres");
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		
		HashMap<String, String> updateAddress = new HashMap<String, String>();
		updateAddress.put("id", id);
		updateAddress.put("postcode", postcode);
		updateAddress.put("adres", adres);
		updateAddress.put("detailadres", detailadres);
		updateAddress.put("extraadres", extraadres);
		
		if(!updateAddress.isEmpty()) {
			memberService.changeAddress(updateAddress);
			return "1";
		} else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/selectEmail",method=RequestMethod.POST)
	public String pullEmail(HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		
		MemberVO result = memberService.selectById(id);
		String email = result.getEmail();
		return email;
	}
	
	@ResponseBody
	@RequestMapping(value="/changeEmail",method = RequestMethod.POST)
	public String changeEmail(HttpSession session, HttpServletRequest req) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id = authInfo.getId();
		String email = req.getParameter("email");
		
		HashMap<String, String> changeEmail = new HashMap<String, String>();
		changeEmail.put("id", id);
		changeEmail.put("email", email);
		
		if(!email.equals(null)) {
			memberService.changeEmail(changeEmail);
			return "1";
		} else {
			System.out.println("이메일 업데이트 실패");
			return "0";
		}
	}
	 
	@ResponseBody
	@RequestMapping(value="/changeNic",method=RequestMethod.POST)
	public String changeNic(HttpServletRequest req, HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id =authInfo.getId();
		String nic = req.getParameter("nic");
		
		HashMap<String, String> changeNic = new HashMap<String, String>();
		changeNic.put("id", id);
		changeNic.put("nic", nic);
		if(!nic.equals("")) {
			memberService.changeNic(changeNic);
			return "1";
		} else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/selectThumbImg",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String pullThumbNail(HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id =authInfo.getId();
		MemberVO memberVO = memberService.selectById(id);
		String thumbImg = memberVO.getThumbImg();
		
		return thumbImg;
	}
	
	@ResponseBody
	@RequestMapping(value="/changeImg",method = RequestMethod.POST)
	public String changeImg(MultipartFile file, HttpSession session) throws IOException, Exception {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String id =authInfo.getId();
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		HashMap<String, String> changeImg = new HashMap<>();
		changeImg.put("id", id);
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") { // 파일이 null이 아니고 공백도 아닐 경우
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			changeImg.put("fileImg", File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			changeImg.put("thumbImg", File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "default.jpg";
			changeImg.put("fileImg", fileName);
			changeImg.put("thumbImg", fileName);
		}
		if(!changeImg.isEmpty()) {
			memberService.changeImg(changeImg);
			return "1";
		} else {
			return "0";
		}
	}
	
}