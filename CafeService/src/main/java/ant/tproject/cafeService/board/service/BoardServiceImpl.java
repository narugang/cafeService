package ant.tproject.cafeService.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ant.tproject.cafeService.board.dao.BoardDao;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.cafe.CafeDto;

@Service
public class BoardServiceImpl implements BoardService {
	private BoardDao boardDao;

	public BoardDao getBoardDao() {
		return boardDao;
	}

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return boardDao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.listCount(scri);
	}

	@Override
	public List<CafeDto> blist(SearchCriteria scri) throws Exception {
		System.out.println("service blist");
		return boardDao.blist(scri);
	}

	@Override
	public int blistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.blistCount(scri);
	}

	//

	@Override
	public int bdelete(CafeDto cafeDto) {
		return boardDao.bdelete(cafeDto);
	}

	@Override
	public int bedit(CafeDto cafeDto) {
		return boardDao.bupdate(cafeDto);
	}

	@Override
	public void bwrite(CafeDto cafeDto) {
		System.out.println("ser1");
		boardDao.binsert(cafeDto);
	}

	//

	@Override
	public BoardVO bread(int seq) {
		boardDao.bupdateReadCount(seq);
		return boardDao.bselect(seq);
	}

	// 나의 카페 목록
	@Override
	public List<CafeDto> myblist(SearchCriteria scri) throws Exception {
		System.out.println("service myblist");
		return boardDao.myblist(scri);
	}

	@Override
	public int myblistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.myblistCount(scri);
	}
	//

	@Override
	public void gorywrite() throws Exception{
		boardDao.goryinsert();
	}
}
