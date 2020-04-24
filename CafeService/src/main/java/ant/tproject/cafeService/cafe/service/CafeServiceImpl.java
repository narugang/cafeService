package ant.tproject.cafeService.cafe.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ant.tproject.cafeService.board.domain.BoardMemberNicVO;
import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.cafe.BfileDto;
import ant.tproject.cafeService.cafe.CafeDto;
import ant.tproject.cafeService.cafe.CategoryDto;
import ant.tproject.cafeService.cafe.CfmemberDto;
import ant.tproject.cafeService.cafe.CfmemberNicDto;
import ant.tproject.cafeService.cafe.PrepboardVO;
import ant.tproject.cafeService.cafe.dao.CafeDao;
import ant.tproject.cafeService.utils.UploadFileUtils;

public class CafeServiceImpl implements CafeService{
	private CafeDao cafeDao;
	public CafeDao getCafeDao() {
		return cafeDao;
	}
	public void setCafeDao(CafeDao cafeDao) {
		this.cafeDao = cafeDao;
	}
	@Override
	public void insertCfmember(CfmemberDto cfmemberDto) {
		cafeDao.insertCfmember(cfmemberDto);
	}
	@Override
	public Integer countCfmember(Map<String, Integer> map) {
		return cafeDao.countCfmember(map);
	}
	@Override
	public CafeDto selectCafe(Integer seq) {
		return cafeDao.selectCafe(seq);
	}
	@Resource(name = "uploadPath")
	private String uploadPath;
	//게시글 추가
	@Override
	public void insertPost(MultipartHttpServletRequest request, Integer writernum) {
		String postsub = request.getParameter("postsub");	
		String content = request.getParameter("content");
		Integer category = Integer.parseInt(request.getParameter("category"));
		BoardVO boardVO = new BoardVO(postsub, content, category, writernum);	//게시글 Dto 생성
		cafeDao.insertPost(boardVO);
		if(!request.getFiles("fileidx").isEmpty()) {	//첨부파일이 비었으면 게시글만 삽입
			Integer postcd = cafeDao.selectBoardCurSeq();	//첨부파일이 삽입된 게시글의 시퀀스번호
			List<MultipartFile> fileList = request.getFiles("fileidx");	//첨부파일들
		    String postUploadPath = uploadPath+File.separator+"postUpload";	//저장경로
		    String ymdPath = UploadFileUtils.calcPathBoard(postUploadPath);	//날짜로 만든 저장경로
		    String fileName = null;	//저장될 파일의 이름
		    for (MultipartFile mf : fileList) {
		        String originFileName = mf.getOriginalFilename(); 
		        long fileSize = mf.getSize(); 
		        try {
		        	fileName = UploadFileUtils.fileUploadBoard(postUploadPath, mf.getOriginalFilename(), mf.getBytes(), ymdPath);
		        	BfileDto bfileDto = new BfileDto(originFileName, fileName  , fileSize, postcd);
		        	cafeDao.insertBfile(bfileDto);
		        } catch (IllegalStateException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
		    }
		}
	}

	//카페명 중복 확인 / titleCheck
	@Override
	public int titleCheck(String title) {
		System.out.println("serviceImpl / title="+title);
		int result = cafeDao.titleCheck(title);
		System.out.println(result+": [받아온 title값이 int result에 들어온 값]");
		return result;
	}
	
	//increase만큼 게시글 불러오기
	@Override
	public List<BoardMemberNicVO> loadPost(Map<String, Integer> map) {
		return cafeDao.loadPost(map);
	}
	//게시글이 하나도 없을 때 increase만큼 불러오기	
	@Override
	public List<BoardMemberNicVO> loadPostZero(Map<String, Integer> map) {
		return cafeDao.loadPostZero(map);
	}		
	//게시물 코드로 파일 정보 불러오기
	@Override
	public List<BfileDto> loadPostFile(Integer postcd) {
		return cafeDao.loadPostFile(postcd);
	}
	//게시글 파일 다운로드
	@Override
	public BfileDto selectBFileForIdx(Integer idx) {
		BfileDto bfileDto = cafeDao.selectBFileForIdx(idx);
		return bfileDto;
	}
	//멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberASC(Map<String, Integer> map) {
		return cafeDao.loadCfmemberASC(map);
	}
	//불러온 멤버정보가 업을 때 멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberZeroASC(Map<String, Integer> map) {
		return cafeDao.loadCfmemberZeroASC(map);
	}
	//멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberDESC(Map<String, Integer> map) {
		return cafeDao.loadCfmemberDESC(map);
	}
	//불러온 멤버정보가 업을 때 멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> loadCfmemberZeroDESC(Map<String, Integer> map) {
		return cafeDao.loadCfmemberZeroDESC(map);
	}
	//멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberASC(Map<String, String> map) {
		return cafeDao.searchCfmemberASC(map);
	}
	//불러온 멤버정보가 업을 때 멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberZeroASC(Map<String, String> map) {
		return cafeDao.searchCfmemberZeroASC(map);
	}
	//멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberDESC(Map<String, String> map) {
		return cafeDao.searchCfmemberDESC(map);
	}
	//불러온 멤버정보가 업을 때 멤버정보 불러오기
	@Override
	public List<CfmemberNicDto> searchCfmemberZeroDESC(Map<String, String> map) {
		return cafeDao.searchCfmemberZeroDESC(map);
	}
	//카페멤버코드를 기준으로 게시물을 가져온다.
	@Override
	public List<BoardMemberNicVO> searchPostCfmem(Map<String, Integer> map) {
		return cafeDao.searchPostCfmem(map);
	}
	//불러온 글이 없을 때 카페멤버코드를 기준으로 게시물을 가져온다.
	@Override
	public List<BoardMemberNicVO> searchPostCfmemZero(Map<String, Integer> map) {
		return cafeDao.searchPostCfmemZero(map);
	}
	//게시글의 제목과 내용을 검색해서 불러온다.
	@Override
	public List<BoardMemberNicVO> searchPostSubContent(Map<String, String> map) {
		return cafeDao.searchPostSubContent(map);
	}
	//불러온 글이 없을 때 게시글의 제목과 내용을 검색해서 불러온다.
	@Override
	public List<BoardMemberNicVO> searchPostSubContentZero(Map<String, String> map) {
		return cafeDao.searchPostSubContentZero(map);
	}
	
	@Override
	public void updateCnt(int seq) throws Exception {
		cafeDao.updateCnt(seq);
		
	}
	@Override
	public void updateViewCnt(int seq) throws Exception {
		cafeDao.updateViewCnt(seq);
		
	}
	//카페의 오픈여부 확인
	public Integer checkOpenCafe(Integer cafe) {
		return cafeDao.checkOpenCafe(cafe);
	}
	//카페 코드랑 사용자의 코드로 권한을 확인합니다.
	public String selectCfmemberAuth(Map<String, Integer> map) {
		return cafeDao.selectCfmemberAuth(map);
	}
	//카테고리 생성
	@Override
	public Integer insertCategory(CategoryDto categoryDto) {
		Integer cafe = categoryDto.getCafe();
		cafeDao.insertCategory(categoryDto);
		return cafeDao.selectCategoryCodeMax(cafe);
	}
	//카테고리 조회
	public List<CategoryDto> selectCategory(Integer cafe) {
		return cafeDao.selectCategory(cafe);
	}
	//카테고리 수정
	public void updateCategory(String[] code, String[] name) {
		for(int i=0;i<name.length;i++) {
			CategoryDto categoryDto = new CategoryDto(Integer.parseInt(code[i]), name[i]);
			cafeDao.updateCategory(categoryDto);
		}
		
	}
	//카테고리 삭제
	public void deleteCategory(Map<String, String[]>map) {
		cafeDao.deleteCategory(map);
	}
	//increase만큼 카페전체 게시글 불러오기
	@Override
	public List<BoardMemberNicVO> loadPostAll(Map<String, Integer> map) {
		return cafeDao.loadPostAll(map);
	}
	//카페전체 게시글이 하나도 없을 때 increase만큼 불러오기	
	@Override
	public List<BoardMemberNicVO> loadPostAllZero(Map<String, Integer> map) {
		return cafeDao.loadPostAllZero(map);
	}
	//게시글 코드로 게시글 정보 불러오기
	@Override
	public BoardVO selectPostCode(int code) {
		return cafeDao.selectPostCode(code);
	}
	//게시글을 변경할 정보를 받아와서 게시글 수정
	@Override
	public void updatePost(BoardVO post) {
		 cafeDao.updatePost(post);
	}
	//게시글 코드를 기준으로 게시글 삭제
	@Override
	public void deletePost(Integer code) {
		cafeDao.deletePost(code);
	}
	//멤버 코드로  닉네임 조회
	@Override
	public String compareNumNic(Integer num) {
		return cafeDao.compareNumNic(num);
	}

	//게시글 신고 기능
	@Override
	public void prepboard(PrepboardVO prepboardVO) {
		cafeDao.prepboard(prepboardVO);
	}
	
	//신고 게시글 불러오기
	public List<PrepboardVO> selectPrepBoard(Integer seq) {
		return cafeDao.selectPrepBoard(seq);
	}

}