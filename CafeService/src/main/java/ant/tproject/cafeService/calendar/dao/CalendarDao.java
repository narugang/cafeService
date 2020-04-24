package ant.tproject.cafeService.calendar.dao;

import java.util.List;
import java.util.Map;

import ant.tproject.cafeService.calendar.CalendarDto;
import ant.tproject.cafeService.calendar.CalendarMonthDto;
import ant.tproject.cafeService.calendar.CalendarNicDto;

public interface CalendarDao {
	List<CalendarMonthDto> selectCalendarMonth (Integer cafe);
	void insertCalendar(CalendarDto calendarDto);;
	void updateCalendar(Map<String, String> map);
	void updateCalendarSize(Map<String, String> map);
	List<CalendarDto> selectCalendar(Map<String, String> map); 
	void deleteCalendar(Integer code);
	void updateCalendarList(CalendarMonthDto calendarMonthDto);
	//increase만큼 일정을 가져옵니다.
	List<CalendarNicDto> loadCalendarPost(Map<String, Integer> map);
	//맨처음 불러온 일정이 없을때 increase만큼 일정을 가져옵니다.
	List<CalendarNicDto> loadCalendarPostZero(Map<String, Integer> map);
	//닉네임과  제목, 네용을 기준으로 검색된 결과를 increase만큼 일정을 가져옵니다.
	List<CalendarNicDto> searchCalendarPost(Map<String, String> map);
	//닉네임과 제목, 네용을 기준으로 검색된 결과를 맨처음 불러온 일정이 없을때 increase만큼 일정을 가져옵니다.
	List<CalendarNicDto> searchCalendarPostZero(Map<String, String> map);
	//관리자 권한을 확인합니다.
	boolean checkAuthC1(Map<String, Integer> map);
	//기간동안 모든글 불러오기
	List<CalendarDto> selectCalendarAdmin(Map<String, String> map);
	//회원 번호로 닉네임 찾기
	String compareNumNic (Integer num);
}
