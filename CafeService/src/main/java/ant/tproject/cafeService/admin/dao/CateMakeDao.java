package ant.tproject.cafeService.admin.dao;

import java.util.List;

import ant.tproject.cafeService.admin.CateMakeVO;

public interface CateMakeDao {

	//카테고리 등록
	public abstract void insert(CateMakeVO cateMakeVO);
	
	//카테고리 수정
	
	
	//카테고리 삭제
	public abstract void delete();
	
	//카테고리 출력
	public abstract List<CateMakeVO> selectAll();
	
	//특정 카테고리 출력
	public abstract CateMakeVO selectByName(String name);
	
	//카테고리 중복 확인
	public abstract int dupliInter(String intername);
}
