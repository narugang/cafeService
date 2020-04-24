package ant.tproject.cafeService.calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ant.tproject.cafeService.calendar.CalendarDto;
import ant.tproject.cafeService.calendar.CalendarMonthDto;
import ant.tproject.cafeService.calendar.CalendarNicDto;
import ant.tproject.cafeService.calendar.dao.CalendarDao;

public class CalendarServiceImpl implements CalendarService{
	private CalendarDao calendarDao;
	
	public CalendarDao getCalendarDao() {
		return calendarDao;
	}
	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}	
	@Override
	public List<CalendarMonthDto> selectCalendarMonth(Integer cafe) {
		return calendarDao.selectCalendarMonth(cafe);
	}
	@Override
	public void insertCalendar(CalendarDto calendarDto) {
		calendarDao.insertCalendar(calendarDto);
	}
	@Override
	public void updateCalendar(Map<String, String> map) {
		calendarDao.updateCalendar(map);
	}
	@Override
	public void updateCalendarSize(Map<String, String> map) {
		calendarDao.updateCalendarSize(map);
	}
	@Override
	public List<CalendarDto> selectCalendar(Map<String, String> map, Integer cafe, Integer num) {
		Map<String, Integer> authchk = new HashMap<String, Integer>();
		authchk.put("cafe", cafe);
		authchk.put("num", num);
		if(calendarDao.checkAuthC1(authchk))
			return calendarDao.selectCalendarAdmin(map);	
		return calendarDao.selectCalendar(map);
	}
	@Override
	public void deleteCalendar(String[] code) {
		for(String s: code) {
			Integer i = Integer.parseInt(s);
			calendarDao.deleteCalendar(i);
		}
	}
	@Override
	public void updateCalendarList(CalendarMonthDto calendarMonthDto) {
		calendarDao.updateCalendarList(calendarMonthDto);	
	}
	//increase 만큼 일정을 가져옵니다.
	@Override
	public List<CalendarNicDto> loadCalendarPost(Map<String, Integer> map) {
		return calendarDao.loadCalendarPost(map);
	}
	//처음에 일정이 없을 때 increase 만큼 일정을 가져옵니다.
	@Override
	public List<CalendarNicDto> loadCalendarPostZero(Map<String, Integer> map) {
		return calendarDao.loadCalendarPostZero(map);
	}
	//닉네임과  제목, 네용을 기준으로 검색된 결과를 increase 만큼 일정을 가져옵니다.
	@Override
	public List<CalendarNicDto> searchCalendarPost(Map<String, String> map) {
		return calendarDao.searchCalendarPost(map);
	}
	//닉네임과  제목, 네용을 기준으로 검색된 결과를 처음에 일정이 없을 때 increase 만큼 일정을 가져옵니다.
	@Override
	public List<CalendarNicDto> searchCalendarPostZero(Map<String, String> map) {
		return calendarDao.searchCalendarPostZero(map);
	}
	@Override
	public boolean checkAuthC1(Map<String, Integer> authchk) {
		return calendarDao.checkAuthC1(authchk);
	}
	@Override
	public String compareNumNic(Integer num) {
		return calendarDao.compareNumNic(num);
	}
}
