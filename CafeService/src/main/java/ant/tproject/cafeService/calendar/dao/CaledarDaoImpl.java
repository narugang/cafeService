package ant.tproject.cafeService.calendar.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ant.tproject.cafeService.calendar.CalendarDto;
import ant.tproject.cafeService.calendar.CalendarMonthDto;
import ant.tproject.cafeService.calendar.CalendarNicDto;

public class CaledarDaoImpl implements CalendarDao{
		private SqlSessionTemplate sqlSessionTemplate;
		
		public CaledarDaoImpl( SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}
		
		public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}
		@Override
		public List<CalendarMonthDto> selectCalendarMonth(Integer cafe) {
			return sqlSessionTemplate.selectList("Calendar.selectCalendarMonth", cafe);
		}
		@Override
		public void insertCalendar(CalendarDto calendarDto) {
			sqlSessionTemplate.insert("insertCalendar", calendarDto);
		}
		@Override
		public void updateCalendar(Map<String, String> map) {
			sqlSessionTemplate.update("Calendar.updateCalendar", map);
		}
		@Override
		public void updateCalendarSize(Map<String, String> map) {
			sqlSessionTemplate.update("Calendar.updateCalendarSize", map);
		}
		@Override
		public List<CalendarDto> selectCalendar(Map<String, String> map) {
			return sqlSessionTemplate.selectList("Calendar.selectCalendar", map);
		}
		@Override
		public void deleteCalendar(Integer code) {
			sqlSessionTemplate.delete("Calendar.deleteCalendar", code);
		}
		@Override
		public void updateCalendarList(CalendarMonthDto calendarMonthDto) {
			sqlSessionTemplate.update("Calendar.updateCalendarList", calendarMonthDto);
		}
		//increase만큼 일정을 가져옵니다.
		@Override
		public List<CalendarNicDto> loadCalendarPost(Map<String, Integer> map) {
			return sqlSessionTemplate.selectList("Calendar.loadCalendarPost", map);
		}
		//맨처음 불러온 일정이 없을때 increase만큼 일정을 가져옵니다.
		@Override
		public List<CalendarNicDto> loadCalendarPostZero(Map<String, Integer> map) {
			return sqlSessionTemplate.selectList("Calendar.loadCalendarPostZero", map);
		}
		//닉네임과  제목, 네용을 기준으로 검색된 결과를 increase만큼 일정을 가져옵니다.
		@Override
		public List<CalendarNicDto> searchCalendarPost(Map<String, String> map) {
			return sqlSessionTemplate.selectList("Calendar.searchCalendarPost", map);
		}
		//닉네임과  제목, 네용을 기준으로 검색된 결과를 맨처음 불러온 일정이 없을때 increase만큼 일정을 가져옵니다.
		@Override
		public List<CalendarNicDto> searchCalendarPostZero(Map<String, String> map) {
			return sqlSessionTemplate.selectList("Calendar.searchCalendarPostZero", map);
		}
		//관리자 권한을 확인합니다.
		@Override
		public boolean checkAuthC1(Map<String, Integer> map) {			
			String auth = sqlSessionTemplate.selectOne("Cfmember.selectCfmemberAuth", map);
			Boolean result = auth.equals("C1")?true:false;
			return result;
		}
		//기간동안 모든글 불러오기
		@Override
		public List<CalendarDto> selectCalendarAdmin(Map<String, String> map) {
			return sqlSessionTemplate.selectList("Calendar.selectCalendarAdmin", map);
		}
		//회원번호로 닉네임 찾기
		@Override
		public String compareNumNic(Integer num) {
			return sqlSessionTemplate.selectOne("memberDAO.compareNumNic", num);
		}
}
