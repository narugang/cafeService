package ant.tproject.cafeService.board.service;

import java.util.List;

import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.cafe.CafeDto;

public interface BoardService {
	public abstract List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public abstract List<CafeDto> blist(SearchCriteria scri) throws Exception;
	
	public int blistCount(SearchCriteria scri) throws Exception;
	
	public abstract int bdelete(CafeDto cafeDto);
	
	public abstract int bedit(CafeDto cafeDto);

	public abstract void bwrite(CafeDto cafeDto);

	public abstract BoardVO bread(int seq);
	
	//나의 카페 목록
	public abstract List<CafeDto> myblist(SearchCriteria scri) throws Exception;
	
	public int myblistCount(SearchCriteria scri) throws Exception;
	
	//
	public abstract void gorywrite() throws Exception;

}
