package ant.tproject.cafeService.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ant.tproject.cafeService.member.service.MailService;

@Controller
@RequestMapping(value = "/email")
public class MailController {

	MailService mailService;

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@RequestMapping(value = "/createEmailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String createEmailCheck(String email, HttpServletRequest req) {

		// 이메일 발송_S
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession();
		String authCode = String.valueOf(ran);
		
		System.out.println("["+authCode+"]");
		
		session.setAttribute("authCode", authCode);
		
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();

		sb.append("귀하의 인증 코드는 [" + authCode + "] 입니다.");

		mailService.send(subject, sb.toString(), email, null);
		//이메일 발송_E
		return "";

	}

	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		if (originalJoinCode.equals(authCode))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}
}
