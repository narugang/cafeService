package ant.tproject.cafeService.message.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ant.tproject.cafeService.message.MessageVO;
import ant.tproject.cafeService.message.dao.MessageDAO;
import ant.tproject.cafeService.utils.PagingVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	private MessageDAO messageDao;
	
	public MessageDAO getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDAO messageDao) {
		this.messageDao = messageDao;
	}

	@Override
	public void insertMessage(MessageVO messageVO) {
		System.out.println("messageVO="+messageVO);
		messageDao.insertMessage(messageVO);
		
	}

	@Override
	public List<MessageVO> viewSendMessage(int sender) {
		return messageDao.viewSendMessage(sender);
	}

	@Override
	public List<MessageVO> viewReceiveMessage(int num) {
		return messageDao.viewReceiveMessage(num);
	}

	@Override
	public String pullContext(int num) {
		
		return messageDao.pullContext(num);
	}
	
	//paging[S]
	@Override
	public int countMessageSender(int sender) {
		return messageDao.countMessageSender(sender);
	}

	@Override
	public List<MessageVO> selectMessageSender(PagingVO vo) {
		
		return messageDao.selectMessageSender(vo);
	}
	@Override
	public int countMessageTarget(int target) {
		return messageDao.countMessageTarget(target);
	}

	@Override
	public List<MessageVO> selectMessageTarget(PagingVO vo) {
		
		return messageDao.selectMessageTarget(vo);
	}
	//paging[E]
	
	
//	@Override
//	public void addMessage(MessageVO messageVO) {
//		messageDao.create(messageVO);
//	};
//	
//	@Override
//	public MessageVO readMessage(String nick, int num) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//	@Override
//	public MessageVO read(int num) {
//		return messageDao.select(num);
//	}
}
