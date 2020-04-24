package ant.tproject.cafeService.cafe.dao;

import java.util.List;
import java.util.Map;

import ant.tproject.cafeService.board.domain.BoardMemberNicVO;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.cafe.BfileDto;
import ant.tproject.cafeService.cafe.CafeDto;
import ant.tproject.cafeService.cafe.CategoryDto;
import ant.tproject.cafeService.cafe.CfmemberDto;
import ant.tproject.cafeService.cafe.CfmemberNicDto;
import ant.tproject.cafeService.cafe.PrepboardVO;

public interface CafeDao {
	void insertCfmember(CfmemberDto cfmemberDto);
	Integer countCfmember(Map<String, Integer> map);
	CafeDto selectCafe(Integer seq);
	//게시글 삽입
	void insertPost(BoardVO boardVO);
	//해당 게시글 첨부파일 삽입
	void insertBfile(BfileDto bfileDto);
	//최근 게시글 시퀀스 번호 
	Integer selectBoardCurSeq();
	
	//카페명 중복 확인
	public abstract int titleCheck(String title);
	
	//increase를 기준으로 게시글 불러오기
	List<BoardMemberNicVO> loadPost(Map<String, Integer> map);
	//게시글 파일 불러오기 개시글 코드를 기준으로.
	List<BfileDto> loadPostFile(Integer postcd);
	//처음 게시글 하나도 없을 때 불러오기
	List<BoardMemberNicVO> loadPostZero(Map<String, Integer> map);
	//멤버 목록 불러오기 ASC
	List<CfmemberNicDto> loadCfmemberASC(Map<String, Integer> map);
	//불러온 멤버정보가 없을때 멤버정보 불러오기 ASC
	List<CfmemberNicDto> loadCfmemberZeroASC(Map<String, Integer> map);
	//멤버 목록 불러오기 DESC
	List<CfmemberNicDto> loadCfmemberDESC(Map<String, Integer> map);
	//불러온 멤버정보가 없을때 멤버정보 불러오기 DESC
	List<CfmemberNicDto> loadCfmemberZeroDESC(Map<String, Integer> map);
	//닉네임에 searchtext가 포함된 멤버 목록 불러오기 ASC
	List<CfmemberNicDto> searchCfmemberASC(Map<String, String> map);
	//닉네임에 searchtext가 포함된 불러온 멤버정보가 없을때 멤버정보 불러오기 ASC
	List<CfmemberNicDto> searchCfmemberZeroASC(Map<String, String> map);
	//닉네임에 searchtext가 포함된  멤버 목록 불러오기 DESC
	List<CfmemberNicDto> searchCfmemberDESC(Map<String, String> map);
	//닉네임에 searchtext가 포함된 불러온 멤버정보가 없을때 멤버정보 불러오기 DESC
	List<CfmemberNicDto> searchCfmemberZeroDESC(Map<String, String> map);
	//게시글 첨부파일 코드로 정보 불러옥;
	BfileDto selectBFileForIdx(Integer idx);
	//카페멤버코드를 기준으로 전체글에서 검색
	List<BoardMemberNicVO> searchPostCfmem(Map<String, Integer> map);
	//불러온 글이 없을 떄 카페멤버코드를 기준으로 전체글에서 검색
	List<BoardMemberNicVO> searchPostCfmemZero(Map<String, Integer> map);
	//게시글의 제목과 내용을 검색해서 불러온다.
	List<BoardMemberNicVO> searchPostSubContent(Map<String, String> map);
	//불러온 내용이 없을떼 게시글의 제목과 내용을 검색해서 불러온다.
	List<BoardMemberNicVO> searchPostSubContentZero(Map<String, String> map);
	
	//방문수 카운팅
	public void updateCnt(int seq) throws Exception;
			
	//조회수 카운팅
	public void updateViewCnt(int seq) throws Exception;	
	
	//카페의 오픈여부 확인
	Integer checkOpenCafe (Integer cafe);
	//카페 코드랑 사용자의 코드로 권한을 확인합니다.
	String selectCfmemberAuth(Map<String, Integer> map);

	//카테고리 생성
	void insertCategory(CategoryDto categoryDto);
	//카테고리 조회
	List<CategoryDto> selectCategory(Integer cafe);
	//카테고리 수정
	void updateCategory(CategoryDto categoryDto);
	//카테고리 삭제
	void deleteCategory(Map<String, String[]> map);
	//해당 카페의 최근 카테고리번호
	Integer selectCategoryCodeMax(Integer cafe);
	//increase를 기준으로 카페전체 게시글 불러오기
	List<BoardMemberNicVO> loadPostAll(Map<String, Integer> map);
	//처음 카페전체 게시글 하나도 없을 때 불러오기
	List<BoardMemberNicVO> loadPostAllZero(Map<String, Integer> map);
	//게시글 코드로 게시글 정보 불러오기
	BoardVO selectPostCode(int code);
	//게시글을 변경할 정보를 받아와서 게시글 수정
	void updatePost (BoardVO post);
	//게시글 코드를 기준으로 게시글 삭제
	void deletePost (Integer code);
	//멤버코드로 닉네임 조회
	String compareNumNic (Integer num);

		
	//게시글 신고 기능
	public abstract void prepboard(PrepboardVO prepboardVO);
	//신고 게시글 불러오기
	public abstract List<PrepboardVO> selectPrepBoard(Integer seq);
	
	public abstract int deletePrepBoardPost(int postnum);
	
	public abstract int countBfile(int postcd);
	
	public abstract int deleteBfile(int postcd);
	
	public abstract int deletePost(int code);

}
