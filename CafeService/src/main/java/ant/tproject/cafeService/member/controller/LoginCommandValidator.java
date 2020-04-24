package ant.tproject.cafeService.member.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//login form에서 전달받은 값을 검증하는 클래스
public class LoginCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		
		return LoginCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "pwd", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
		
	}

	
	
}
