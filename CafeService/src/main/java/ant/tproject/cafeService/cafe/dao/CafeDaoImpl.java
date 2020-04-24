package ant.tproject.cafeService.cafe.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import ant.tproject.cafeService.board.domain.BoardMemberNicVO;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.cafe.BfileDto;
import ant.tproject.cafeService.cafe.CafeDto;
import ant.tproject.cafeService.cafe.CategoryDto;
import ant.tproject.cafeService.cafe.CfmemberDto;
import ant.tproject.cafeService.cafe.CfmemberNicDto;
import ant.tproject.cafeService.cafe.PrepboardVO;

public class CafeDaoImpl implements CafeDao{
	private SqlSessionTemplate sqlSessionTemplate;
	
	public CafeDaoImpl( SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public void insertCfmember(CfmemberDto cfmemberDto) {
		sqlSessionTemplate.insert("Cfmember.insertCfmember", cfmemberDto);
	}
	@Override
	public Integer countCfmember(Map<String, Integer> map) {
		return sqlSessionTemplate.selectOne("Cfmember.countCfmember", map);
	}
	@Override
	public CafeDto selectCafe(Integer seq) {
		return sqlSessionTemplate.selectOne("Cafe.selectCafe", seq);
	}
	
	//카페명 중복 확인
	@Override
	public int titleCheck(String title) {
		
		int result = sqlSessionTemplate.selectOne("Cafe.titleCheck", title);
		System.out.println(result+" : 1");
		return  result;
	}
	//0402 수정사항
	//게시글 삽입
	@Override
	public void insertPost(BoardVO boardVO) {
	   sqlSessionTemplate.insert("insertBoard", boardVO);
	}
	//게시글 첨부파일 삽입
	@Override
	public void insertBfile(BfileDto bfileDto) {
	   sqlSessionTemplate.insert("Bfile.insertBfile", bfileDto);
	}

	@Override
	public void updateCnt(int seq) throws Exception {
		sqlSessionTemplate.update("updateCnt", seq);
	}
	@Override
	public void updateViewCnt(int seq) throws Exception {
		sqlSessionTemplate.update("updateViewCnt", seq);
	}
	
	//게시글 첨부파일 저장을 위해 현재 개시글의 시퀀스번호를 가져옵니다.
	@Override
	public Integer selectBoardCurSeq() {
	   return sqlSessionTemplate.selectOne("selectBoardCurSeq");
	}
	//0402 수정사항_E
	
	//increase만큼 게시글 불러오기
	public List<BoardMemberNicVO> loadPost(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("loadPost", map);
	}
	//게시글 불러오기 코드를 이용해서 파일정보를 불러옴
	@Override
	public List<BfileDto> loadPostFile(Integer postcd) {
		return sqlSessionTemplate.selectList("Bfile.loadPostFile",postcd);
	}
	//게시글 첨부파일 코드로 정보불러오기
	@Override
	public BfileDto selectBFileForIdx(Integer idx) {
		return sqlSessionTemplate.selectOne("Bfile.selectBFileForIdx", idx);
	}
	//게시글 하나도 없을 때 increase만큼 불러오기
	@Override
	public List<BoardMemberNicVO> loadPostZero(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("loadPostZero", map);
	}
	//멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberASC(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("Cfmember.loadCfmemberASC", map);
	}
	//불러온 멤버목록이 없을 때 멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberZeroASC(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("Cfmember.loadCfmemberZeroASC", map);
	}
	//멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberDESC(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("Cfmember.loadCfmemberDESC", map);
	}
	//불러온 멤버목록이 없을 때 멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberZeroDESC(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("Cfmember.loadCfmemberZeroDESC", map);
	}
	//멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberASC(Map<String, String> map) {
		return sqlSessionTemplate.selectList("Cfmember.searchCfmemberASC", map);
	}
	//불러온 멤버목록이 없을 때 멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberZeroASC(Map<String, String> map) {
		return sqlSessionTemplate.selectList("Cfmember.searchCfmemberZeroASC", map);
	}
	//멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberDESC(Map<String, String> map) {
		return sqlSessionTemplate.selectList("Cfmember.searchCfmemberDESC", map);
	}
	//불러온 멤버목록이 없을 때 멤버목록 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberZeroDESC(Map<String, String> map) {
		return sqlSessionTemplate.selectList("Cfmember.searchCfmemberZeroDESC", map);
	}
	//카페멤버코드를 기준으로 전체글에서 검색
	@Override
	public List<BoardMemberNicVO> searchPostCfmem(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("searchPostCfmem", map);
	}
	//불러온 글이 없을 때 카페멤버코드를 기준으로 전체글에서 검색
	@Override
	public List<BoardMemberNicVO> searchPostCfmemZero(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("searchPostCfmemZero", map);
	}
	//게시글의 제목과 내용을 검색해서 불러온다.
	@Override
	public List<BoardMemberNicVO> searchPostSubContent(Map<String, String> map) {
		return sqlSessionTemplate.selectList("searchPostSubContent", map);
	}
	//불러온 글이 없을 때 게시글의 제목과 내용을 검색해서 불러온다.
	@Override
	public List<BoardMemberNicVO> searchPostSubContentZero(Map<String, String> map) {
		return sqlSessionTemplate.selectList("searchPostSubContentZero", map);
	}
	//카페의 오픈여부 확인
	@Override
	public Integer checkOpenCafe(Integer cafe) {
		return sqlSessionTemplate.selectOne("Cafe.checkOpenCafe", cafe);
	}
	//카페 코드랑 사용자의 코드로 권한을 확인합니다.
	@Override
	public String selectCfmemberAuth(Map<String, Integer> map) {
		return sqlSessionTemplate.selectOne("Cfmember.selectCfmemberAuth", map);
	}
	//카테고리 생성
	@Override
	public void insertCategory(CategoryDto categoryDto) {
		sqlSessionTemplate.insert("Category.insertCategory", categoryDto);
	}
	//카테고리 조회
	public List<CategoryDto> selectCategory(Integer cafe) {
		return sqlSessionTemplate.selectList("Category.selectCategory", cafe);
	}
	//카테고리 수정
	public void updateCategory(CategoryDto categoryDto) {
		sqlSessionTemplate.update("Category.updateCategory", categoryDto);
	}
	//카테고리 삭제
	public void deleteCategory(Map<String, String[]>map) {
		sqlSessionTemplate.delete("Category.deleteCategory", map);
	}
	//해당 카페의 최근 카테고리번호
	@Override
	public Integer selectCategoryCodeMax(Integer cafe) {
		return sqlSessionTemplate.selectOne("Category.selectCategoryCodeMax", cafe);
	}
	//increase만큼 카페전체 게시글 불러오기
	public List<BoardMemberNicVO> loadPostAll(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("loadPostAll", map);
	}
	//카페전체 불러온 게시글 하나도 없을 때 increase만큼 불러오기
	@Override
	public List<BoardMemberNicVO> loadPostAllZero(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("loadPostAllZero", map);
	}
	//게시글 코드로 게시글 정보 불러오기
	@Override
	public BoardVO selectPostCode(int code) {
		return sqlSessionTemplate.selectOne("selectPostCode", code);
	}
	//게시글을 변경할 정보를 받아와서 게시글 수정
	@Override
	public void updatePost(BoardVO post) {
		 sqlSessionTemplate.update("updatePost", post);
	}
	//게시글 코드를 기준으로 게시글 삭제
	@Override
	public void deletePost(Integer code) {		
		sqlSessionTemplate.delete("deletePost", code);
	}
	//멤버코드로 닉네임 조회
	@Override
	public String compareNumNic(Integer num) {
		return sqlSessionTemplate.selectOne("memberDAO.compareNumNic", num);
	}
	//게시글 신고 기능
	@Override
	public void prepboard(PrepboardVO prepboardVO) {
		sqlSessionTemplate.insert("prepboard", prepboardVO);
	}
	//신고 게시글 불러오기
	@Override
	public List<PrepboardVO> selectPrepBoard(Integer seq) {
		
		return sqlSessionTemplate.selectList("Cafe.selectPrepBoard", seq);
	}
	@Override
	public int deletePrepBoardPost(int postnum) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int countBfile(int postcd) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteBfile(int postcd) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deletePost(int code) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
