package ant.tproject.cafeService.board.domain;

import java.util.Date;

//POST VO
public class BoardMemberIdVO {
		
		private int code;
        private String postsub;
        private String writedt;
        private String content;
        private String id;
        private int category;
        private int viewcnt;
        
        public BoardMemberIdVO() {}
		public BoardMemberIdVO(int code, String postsub, String writedt, String content, String id, int category,
				int viewcnt) {
			super();
			this.code = code;
			this.postsub = postsub;
			this.writedt = writedt;
			this.content = content;
			this.id = id;
			this.category = category;
			this.viewcnt = viewcnt;
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

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getWritedt() {
			return writedt;
		}

		public void setWritedt(String writedt) {
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
}