package ant.tproject.cafeService.admin.service;

import java.util.List;

import ant.tproject.cafeService.admin.CateMakeVO;

public interface CateMakeService {

	//카테고리 등록
	public abstract void register(CateMakeVO cateMakeVO);
	
	//전체 보기
	public abstract List<CateMakeVO> viewAll();
	
	//한 가지 항목에 대한 카테고리 보기
	public abstract String cateOne(String cateOne);
	
	//카테고리 중복 확인
	public abstract int dupliInter(String intername);
}
