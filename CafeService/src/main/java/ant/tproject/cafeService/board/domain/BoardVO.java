package ant.tproject.cafeService.board.domain;

import java.util.Date;

//POST VO
public class BoardVO {
		
		private int code;
        private String postsub;
        private String content;
        private int writernum;
        private Date writedt;
        private int viewcnt;
        private int category;
        private int cafe;
        
        private String nic;
        private int postcode;
        
		public String getNic() {
			return nic;
		}
		public void setNic(String nic) {
			this.nic = nic;
		}
		public int getPostcode() {
			return postcode;
		}
		public void setPostcode(int postcode) {
			this.postcode = postcode;
		}
		public int getCafe() {
			return cafe;
		}
		public void setCafe(int cafe) {
			this.cafe = cafe;
		}
		
		public BoardVO() {}
		
		public BoardVO(int code, String postsub, String content, int writernum, Date writedt, int viewcnt, int category,
				int cafe) {
			super();
			this.code = code;
			this.postsub = postsub;
			this.content = content;
			this.writernum = writernum;
			this.writedt = writedt;
			this.viewcnt = viewcnt;
			this.category = category;
			this.cafe = cafe;
		}
		
		// CafeService_insertPost
		public BoardVO(String postsub, String content, int category,int writernum) {
			super();
			this.postsub = postsub;
			this.content = content;
			this.writernum = writernum;
			this.category = category;
		}
		
		public int getCode() {
			return code;
		}
		public void setCode(int code) {
			this.code = code;
		}
		public String getPostsub() {
			return postsub;
		}
		public void setPostsub(String postsub) {
			this.postsub = postsub;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getWriternum() {
			return writernum;
		}
		public void setWriternum(int writernum) {
			this.writernum = writernum;
		}
		public Date getWritedt() {
			return writedt;
		}
		public void setWritedt(Date writedt) {
			this.writedt = writedt;
		}
		public int getViewcnt() {
			return viewcnt;
		}
		public void setViewcnt(int viewcnt) {
			this.viewcnt = viewcnt;
		}
		public int getCategory() {
			return category;
		}
		
		public void setCategory(int category) {
			this.category = category;
		}
		
		public BoardVO(int code, String postsub, String content, int category) {
			super();
			this.code = code;
			this.postsub = postsub;
			this.content = content;
			this.category = category;
		}
		
}
