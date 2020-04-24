package ant.tproject.cafeService.message;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("MessageVO")
public class MessageVO {
	
	private int num;
	private int target;
	private int sender;
	private String title;
	private String content;
	private Date open;
	private Date send;
	private String viewTarget;
	private String viewSender;
	
	public String getViewTarget() {
		return viewTarget;
	}

	public void setViewTarget(String viewTarget) {
		this.viewTarget = viewTarget;
	}

	public String getViewSender() {
		return viewSender;
	}

	public void setViewSender(String viewSender) {
		this.viewSender = viewSender;
	}

	public MessageVO() {
		super();
	}
	
	public MessageVO(int target, int sender, String title, String content) {
		super();
		this.target = target;
		this.sender = sender;
		this.title = title;
		this.content = content;
	}
	
	public MessageVO(int num, int target, int sender, String title, String content, Date open, Date send) {
		super();
		this.num = num;
		this.target = target;
		this.sender = sender;
		this.title = title;
		this.content = content;
		this.open = open;
		this.send = send;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getOpen() {
		return open;
	}
	public void setOpen(Date open) {
		this.open = open;
	}
	public Date getSend() {
		return send;
	}
	public void setSend(Date send) {
		this.send = send;
	}
	
	@Override
	public String toString() {
		return "MessageVO [num=" + num + ", target=" + target + ", sender=" + sender + ", title=" + title + ", content="
				+ content + ", open=" + open + ", send=" + send + "]";
	}

	
	
}
