package ant.tproject.cafeService.message.service;

import java.util.List;

import ant.tproject.cafeService.message.MessageVO;
import ant.tproject.cafeService.utils.PagingVO;

public interface MessageService {
	//도현
//	public void addMessage(MessageVO messageVO);
//	public MessageVO readMessage(String nick, int num);
//	public MessageVO read(int num);
	//도현[E]
	
	//태헌[S]
	public void insertMessage(MessageVO messageVO);
	
	public List<MessageVO> viewSendMessage(int sender);
	
	public List<MessageVO> viewReceiveMessage(int num);
	//태헌[E]
	public String pullContext(int num);
	
	//paging[S]
	//메시지 총 갯수(sender)
	public int countMessageSender(int sender);
	// 페이징 처리 게시글 조회(sender)
	public List<MessageVO> selectMessageSender(PagingVO vo);
	
	//메시지 총 갯수(sender)
	public int countMessageTarget(int target);
	// 페이징 처리 게시글 조회(sender)
	public List<MessageVO> selectMessageTarget(PagingVO vo);	
	//paging[E]
}
