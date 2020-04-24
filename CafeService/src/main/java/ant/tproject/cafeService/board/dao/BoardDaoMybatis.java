package ant.tproject.cafeService.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import ant.tproject.cafeService.board.domain.BoardVO;
import ant.tproject.cafeService.board.domain.SearchCriteria;
import ant.tproject.cafeService.cafe.CafeDto;

@Repository
public class BoardDaoMybatis implements BoardDao {

        private SqlSessionTemplate sqlSessionTemplate;

        public BoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate){
        	 this.sqlSessionTemplate = sqlSessionTemplate;
        }
        
        public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
                this.sqlSessionTemplate = sqlSessionTemplate;
        }

        
        
        @Override
        public List<BoardVO> list(SearchCriteria scri) throws Exception{
        	//TODO Auto-generated method stub
                return sqlSessionTemplate.selectList("listPage", scri);
        }
        
        
        @Override
        public int listCount(SearchCriteria scri) throws Exception{
        	//TODO Auto-generated method stub
                return sqlSessionTemplate.selectOne("listCount", scri);
        }
        
        @Override
        public List<CafeDto> blist(SearchCriteria scri) throws Exception{
        	//TODO Auto-generated method stub
                return sqlSessionTemplate.selectList("blistPage", scri);
        }
        
        
        @Override
        public int blistCount(SearchCriteria scri) throws Exception{
        	//TODO Auto-generated method stub
                return sqlSessionTemplate.selectOne("blistCount");
        }
        
        
        
        
        
        
        @Override
        public int delete(BoardVO boardVO) {
                return sqlSessionTemplate.delete("delete", boardVO);
        }
        @Override
        public int deleteAll() {
                return sqlSessionTemplate.delete("deleteAll");
        }
        @Override
        public int update(BoardVO boardVO) {
                return sqlSessionTemplate.update("update", boardVO);
        }
        @Override
        public void insert(BoardVO boardVO) {
                sqlSessionTemplate.insert("insert", boardVO);
        }
        @Override
        public BoardVO select(int seq) {
                BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", seq);
                return vo;
        }
        @Override
        public int updateReadCount(int seq) {
                return sqlSessionTemplate.update("updateCount", seq);
        }
        
        
        @Override
        public int bdelete(CafeDto cafeDto) {
                return sqlSessionTemplate.delete("bdelete", cafeDto);
        }
        @Override
        public int bdeleteAll() {
                return sqlSessionTemplate.delete("bdeleteAll");
        }
        @Override
        public int bupdate(CafeDto cafeDto) {
                return sqlSessionTemplate.update("bupdate", cafeDto);
                
                
        }
        
        @Override
        public void binsert(CafeDto cafeDto) {
        	System.out.println("dao1");
        	System.out.println(cafeDto.toString());
                sqlSessionTemplate.insert("binsert", cafeDto);
        }
        
        @Override
        public BoardVO bselect(int seq) {
                BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("bselect", seq);
                return vo;
        }
        
        @Override
        public int bupdateReadCount(int seq) {
                return sqlSessionTemplate.update("bupdateCount", seq);
        }
        
        //나의 카페 목록
        @Override
        public List<CafeDto> myblist(SearchCriteria scri) throws Exception{
        	System.out.println("dao myblist");
        	//TODO Auto-generated method stub
                return sqlSessionTemplate.selectList("myblistpage", scri);
        }
        
        
        @Override
        public int myblistCount(SearchCriteria scri) throws Exception{
                return sqlSessionTemplate.selectOne("myblistCount", scri);
        }
        
        @Override
        public void goryinsert() {
        		System.out.println("gorydao1");
                sqlSessionTemplate.insert("goryinsert");
                System.out.println("gorydao2");
        }
        
        
        
        
        

}
