package ant.tproject.cafeService.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ant.tproject.cafeService.admin.CateMakeVO;
import ant.tproject.cafeService.admin.dao.CateMakeDao;

@Service
public class CateMakeServiceImpl implements CateMakeService{

	private CateMakeDao cateMakeDao;
	
	public CateMakeDao getCateMakeDao() {
		return cateMakeDao;
	}

	public void setCateMakeDao(CateMakeDao cateMakeDao) {
		this.cateMakeDao = cateMakeDao;
	}

	@Override
	public void register(CateMakeVO cateMakeVO) {
		cateMakeDao.insert(cateMakeVO);
	}

	@Override
	public List<CateMakeVO> viewAll() {
		List<CateMakeVO> result = cateMakeDao.selectAll();
		return result;
	}

	@Override
	public String cateOne(String cateOne) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dupliInter(String intername) {
		
		return cateMakeDao.dupliInter(intername);
	}
	
	
	
}
