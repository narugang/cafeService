package ant.tproject.cafeService.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ant.tproject.cafeService.admin.CateMakeVO;

public class CateMakeDaoImpl implements CateMakeDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public CateMakeDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	//카테고리 등록
	@Override
	public void insert(CateMakeVO cateMakeVO) {
		sqlSessionTemplate.insert("cateMakeDAO.insert", cateMakeVO);
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
	}

	@Override
	public List<CateMakeVO> selectAll() {
		
		List<CateMakeVO> result = sqlSessionTemplate.selectList("cateMakeDAO.selectAll");
		System.out.println(result);
		return result;
		
	}

	@Override
	public CateMakeVO selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dupliInter(String intername) {
		return sqlSessionTemplate.selectOne("cateMakeDAO.dupliInter", intername);
	}
	
	
	
	

}
