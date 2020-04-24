package ant.tproject.cafeService.board.domain;

//POST VO
public class BoardMemberNicVO {
		
		private int code;
        private String postsub;
        private String writedt;
        private String content;
        private String nic;
        private String name;
        private String thumbimg;
        private int viewcnt;
        
        public BoardMemberNicVO() {}
		public BoardMemberNicVO(int code, String postsub, String writedt, String content, String nic, String name, String thumbimg,
				int viewcnt) {
			super();
			this.code = code;
			this.postsub = postsub;
			this.writedt = writedt;
			this.content = content;
			this.nic = nic;
			this.name = name;
			this.thumbimg =  thumbimg;
			this.viewcnt = viewcnt;
		}


		public String getThumbimg() {
			return thumbimg;
		}
		public void setThumbimg(String thumbimg) {
			this.thumbimg = thumbimg;
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

		public String getNic() {
			return nic;
		}

		public void setNic(String nic) {
			this.nic = nic;
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

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}        
}