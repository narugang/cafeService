package ant.tproject.cafeService.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ant.tproject.cafeService.member.authInfo.AuthInfo;
import ant.tproject.cafeService.member.authInfo.AuthService;

@Controller
public class LoginController {

	private AuthService authService;

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	@RequestMapping(value="/loginform" ,method = RequestMethod.GET)
	public String form(LoginCommand loginCommand) {
		return "/loginform";
	}

	@RequestMapping(value="/loginform", method = RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session) {

		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "/loginform";
		}
		try {
			AuthInfo authInfo = authService.authenticate(loginCommand.getId(), loginCommand.getPwd());
			// 세션에 auth값을 저장하는 리턴
			session.setAttribute("authInfo", authInfo);
			System.out.println(authInfo + "authInfo에 담긴 값");
			return "redirect:/bandmain";
		} catch (Exception e) {
			session.setAttribute("data", "false");
			return "/loginform";
		}
	}
	
	

}
