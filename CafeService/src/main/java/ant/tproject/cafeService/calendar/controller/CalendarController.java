package ant.tproject.cafeService.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.spec.C14NMethodParameterSpec;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import ant.tproject.cafeService.cafe.service.CafeService;
import ant.tproject.cafeService.calendar.CalendarDto;
import ant.tproject.cafeService.calendar.CalendarMonthDto;
import ant.tproject.cafeService.calendar.CalendarNicDto;
import ant.tproject.cafeService.calendar.service.CalendarService;
import ant.tproject.cafeService.member.controller.MemberController;

@Controller
public class CalendarController {
	private CalendarService calendarService;
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	//한달치 일정 출력
	@RequestMapping(value = "/calendarmonth", method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarMonthDto> calendarmonth(HttpSession session, HttpServletRequest request, String id, Model model) throws JsonProcessingException {
		HashMap<String, Integer> todaycafe = new HashMap<>();
		Integer cafe = Integer.parseInt(request.getParameter("seq"));
		todaycafe.put("cafe", cafe);
		List<CalendarMonthDto> calendarmonth = calendarService.selectCalendarMonth(cafe);
		return calendarmonth;
	}
	
	//calendarInput.jsp 호출
	@RequestMapping(value = "/calendarInput", method = RequestMethod.GET)
	public String calendarInputG(Model model, HttpServletRequest request) {
		model.addAttribute("seq", request.getParameter("seq"));
		return "calendarInput"; 
	}
	
	//
	@RequestMapping(value = "/calendarInput", method = RequestMethod.POST)
	public void calendarInput(HttpSession session, HttpServletRequest request) {
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		String title = request.getParameter("title");
		String calcontxt = request.getParameter("contxt");
		String color = request.getParameter("color");
		Integer cafe = Integer.parseInt(request.getParameter("seq"));
		String[] calstartdate = request.getParameterValues("startdate");
		String[] calstarttime = request.getParameterValues("starttime");
		String[] enddate = request.getParameterValues("enddate");
		String[] endtime = request.getParameterValues("endtime");
		int startLength= calstartdate.length;
		int endLength= enddate.length;
		if((startLength == calstarttime.length)==(endLength == endtime.length)) {
			for(int i = 0;i<startLength;i++) {
				calendarService.insertCalendar(new CalendarDto(num, title, calcontxt, calstartdate[i]+calstarttime[i], enddate[i]+endtime[i], color, cafe ));
			}
		}		
	}
	
	@RequestMapping(value = "/calendarUpdate", method = RequestMethod.POST)
	@ResponseBody
	public void calendarUpdate(HttpSession session, HttpServletRequest request) {
		Map<String, String>  map = new HashMap<>();
		String id = request.getParameter("id");
		String between = request.getParameter("between");
		String betweenStart = between.substring(0,10)+between.substring(11, 16);
		map.put("id", id);
		map.put("betweenStart", betweenStart);
		calendarService.updateCalendar(map);
	}
	@RequestMapping(value = "/calendarUpdateSize", method = RequestMethod.POST)
	@ResponseBody
	public void calendarUpdateSize(HttpSession session, HttpServletRequest request) {
		Map<String, String>  map = new HashMap<>();
		String id = request.getParameter("id");
		String between = request.getParameter("between");
		String betweenEnd = between.substring(0,10)+between.substring(11, 16);
		map.put("id", id);
		map.put("betweenEnd", betweenEnd);
		calendarService.updateCalendarSize(map);
	}
	@RequestMapping(value = "/selectCalendar", method = RequestMethod.GET)
	public String selectCalendar(HttpSession session, HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<>();
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));
		String memcode = MemberController.loginMemberCheck(session);		
		Integer num = Integer.parseInt(memcode);
		map.put("calstart", startDate);
		map.put("end", endDate);
		map.put("memcode", memcode);
		List<CalendarDto> calendarDto = calendarService.selectCalendar(map, cafe, num);
		model.addAttribute("startdate", startDate);
		model.addAttribute("enddate", endDate);
		model.addAttribute("calendarDto", calendarDto);
		return "update";
	}
	@RequestMapping(value = "/calendarDelete", method = RequestMethod.POST)
	@ResponseBody
	public void calendarDelete(HttpServletRequest request) {
		String[] code = request.getParameterValues("result");
		calendarService.deleteCalendar(code);
	}
	@RequestMapping(value = "/updateCalendarList", method = RequestMethod.POST)
	@ResponseBody
	public void updateCalendarList(HttpServletRequest request) {
		String[] code = request.getParameterValues("code");
		String[] title = request.getParameterValues("title");
		String[] start = request.getParameterValues("start");
		String[] end = request.getParameterValues("end");
		String[] color = request.getParameterValues("color");
		for(int i = 0;i<code.length;i++) {
			CalendarMonthDto calendarMonthDto = new CalendarMonthDto(Integer.parseInt(code[i]), title[i], start[i], end[i], color[i]);
			calendarService.updateCalendarList(calendarMonthDto);
		}
	}
	//increase만큼 일정을 가져옵니다.
	@RequestMapping(value = "/loadCalendarPost", method = RequestMethod.POST)	
	public String loadCalendarPost(HttpServletRequest request, HttpSession session, Model model) {
		Map<String, Integer> map = new HashMap<>();
		Map<String, Integer> authchk = new HashMap<>();
		Integer cafe = Integer.parseInt(request.getParameter("cafe"));
		Integer postLoadCnt = Integer.parseInt(request.getParameter("postLoadCnt"));	//현재 불러온 글갯수
		Integer increase = Integer.parseInt(request.getParameter("increase")); //보여주고 싶은 글갯수
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		map.put("cafe", cafe);
		map.put("increase", increase);
		authchk.put("cafe", cafe);
		authchk.put("num", num);
		boolean authchkResult = calendarService.checkAuthC1(authchk);
		String nic = calendarService.compareNumNic(num);
		model.addAttribute("authchkResult", authchkResult);
		model.addAttribute("nic", nic);
		List<CalendarNicDto> result; 
		if(postLoadCnt == 0){		//불러온 글이 없을 경우
			result = calendarService.loadCalendarPostZero(map);
			model.addAttribute("calendarPostList", result);
			return "calendarPost";
		}
		map.put("postLoadCnt", postLoadCnt);
		result = calendarService.loadCalendarPost(map);
		model.addAttribute("calendarPostList", result);
		return "calendarPost";
	}
	//increase만큼 일정을 가져옵니다.
	@RequestMapping(value = "/searchCalendarPost", method = RequestMethod.POST)	
	public String searchCalendarPost(HttpServletRequest request, HttpSession session, Model model) {
		Map<String, String> map = new HashMap<>();
		Map<String, Integer> authchk = new HashMap<>();
		String cafe = request.getParameter("cafe");
		String postLoadCnt = request.getParameter("postLoadCnt");	//현재 불러온 글갯수
		String increase = request.getParameter("increase"); //보여주고 싶은 글갯수
		String searchtext = request.getParameter("searchtext"); //보여주고 싶은 글갯수
		Integer num = Integer.parseInt(MemberController.loginMemberCheck(session));
		map.put("cafe", cafe);
		map.put("increase", increase);
		map.put("searchtext", searchtext);
		authchk.put("cafe", Integer.parseInt(cafe));
		authchk.put("num", num);
		List<CalendarNicDto> result; 
		boolean authchkResult = calendarService.checkAuthC1(authchk);
		String nic = calendarService.compareNumNic(num);
		model.addAttribute("authchkResult", authchkResult);
		model.addAttribute("nic", nic);
		if(postLoadCnt.equals("0")){		//불러온 글이 없을 경우
			result = calendarService.searchCalendarPostZero(map);
			model.addAttribute("calendarPostList", result);
			return "calendarPost";
		}
		map.put("postLoadCnt", postLoadCnt);
		result = calendarService.searchCalendarPost(map);
		model.addAttribute("calendarPostList", result);
		return "calendarPost";
	}
}
