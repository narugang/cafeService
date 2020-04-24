package ant.tproject.cafeService.board.dao;

import java.util.List;

import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.cafe.CafeDto;

public interface BoardDao {
	
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public List<CafeDto> blist(SearchCriteria scri) throws Exception;
	
	public int blistCount(SearchCriteria scri) throws Exception;
	
	public abstract int delete(BoardVO boardVO);
	
	public abstract int deleteAll();
	
	public abstract int update(BoardVO boardVO);
	
	public abstract void insert(BoardVO boardVO);
	
	public abstract BoardVO select(int seq);
	
	public abstract int updateReadCount(int seq);
	
	public abstract int bdeleteAll();

	//
	
	public abstract int bdelete(CafeDto cafeDto);
	
	public abstract int bupdate(CafeDto cafeDto);
	
	public abstract void binsert(CafeDto cafeDto);
	
	//
	
	public abstract BoardVO bselect(int seq);
	
	public abstract int bupdateReadCount(int seq);
	
	//나의 카페 목록
	public List<CafeDto> myblist(SearchCriteria scri) throws Exception;
	
	public int myblistCount(SearchCriteria scri) throws Exception;
	//
	
	//카테고리 자동 생성(자유 게시판)
	public abstract void goryinsert()  throws Exception;
	
	
	
	
}
