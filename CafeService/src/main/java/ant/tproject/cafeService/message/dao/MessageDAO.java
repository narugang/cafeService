package ant.tproject.cafeService.message.dao;

import java.util.List;

import ant.tproject.cafeService.message.MessageVO;
import ant.tproject.cafeService.utils.PagingVO;

public interface MessageDAO {
	//도현[S]
//	public abstract void create(MessageVO messageVO);
//	public void updateMessage(int num);
//	public List<MessageVO> selectByNick(String target);
//	public MessageVO select(int num);
	//도현[E]
	
	//태헌[S]
	//메시지 보내기
	public abstract void insertMessage(MessageVO messageVO);
	
	//내가 보낸 메시지(sendMessageBox)
	public abstract List<MessageVO> viewSendMessage(int num);
	
	//내가 받은 메시지
	public abstract List<MessageVO> viewReceiveMessage(int num);
	//태헌[E]	
	
	//메시지 내용 출력 
	public abstract String pullContext(int num);
	
	
	//paging[S]
	//메시지 총 갯수(sender)
	public int countMessageSender(int sender);
	// 페이징 처리 게시글 조회(sender)
	public List<MessageVO> selectMessageSender(PagingVO vo);
	
	//메시지 총 갯수(target)
	public int countMessageTarget(int target);
	// 페이징 처리 게시글 조회(target)
	public List<MessageVO> selectMessageTarget(PagingVO vo);
	
	
	//paging[E]
	
	
	
	
}
