package ant.tproject.cafeService.message.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import ant.tproject.cafeService.message.MessageVO;
import ant.tproject.cafeService.utils.PagingVO;

public class MessageDAOImpl implements MessageDAO{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MessageDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//Message insert
	@Override
	public void insertMessage(MessageVO messageVO) {
		sqlSessionTemplate.insert("message.insertMessage", messageVO);
		
	}

	@Override
	public List<MessageVO> viewSendMessage(int sender) {
		
		return sqlSessionTemplate.selectList("message.viewSendMessage", sender);
	}

	@Override
	public List<MessageVO> viewReceiveMessage(int num) {
		
		return sqlSessionTemplate.selectList("message.viewReceiveMessage", num);
	}

	@Override
	public String pullContext(int num) {
		
		return sqlSessionTemplate.selectOne("message.pullContext", num);
	}

	//paging[S]
	@Override
	public int countMessageSender(int sender) {
		
		return sqlSessionTemplate.selectOne("message.countMessageSender", sender);
	}

	@Override
	public List<MessageVO> selectMessageSender(PagingVO vo) {
		
		return sqlSessionTemplate.selectList("message.selectMessageSender", vo);
	}
	
	@Override
	public int countMessageTarget(int target) {
		
		return sqlSessionTemplate.selectOne("message.countMessageTarget", target);
	}

	@Override
	public List<MessageVO> selectMessageTarget(PagingVO vo) {
		
		return sqlSessionTemplate.selectList("message.selectMessageTarget", vo);
	}
	//paging[E]
	
	
	
	
	
	
	
	
	
	
//	public void setSqlMapClient(SqlSessionTemplate sqlsessionTemplate) {
//	this.sqlSessionTemplate = sqlsessionTemplate;
//}
//	@Override
//	public void create(MessageVO messageVO) {
//		sqlSessionTemplate.insert("message.create", messageVO);
//	}
//	@Override
//	public void updateMessage(int num) {
//		// TODO Auto-generated method stub
//		
//	}
//	
//	@Override
//	public List<MessageVO> selectByNick(String target) {
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("target", target);
//		System.out.println(map);
//		return sqlSessionTemplate.selectList("message.nickView", map);
//	}
//	
//	@Override
//	public MessageVO select(int num) {
//		MessageVO vo = sqlSessionTemplate.selectOne("message.select", num);
//		return vo;
//	}
}
