package ant.tproject.cafeService.cafe;

public class CafeDto {
	 	private Integer seq;  
	 	private String title;  
	 	private String content; 
	 	private String regdate; 
	 	
	 	private String intere; 
	 	private Integer open;  
	 	private String image;  
	 	private String postcode; 
	 	private String address; 
	 	private String detailaddress; 
	 	private String extraaddress; 
	 	private Integer cnt;
	 	private Integer tocnt;
	 	
	 	private Integer viewcnt;
	 	
	 	public Integer getViewcnt() {
			return viewcnt;
		}
		public void setViewcnt(Integer viewcnt) {
			this.viewcnt = viewcnt;
		}
		
		public CafeDto() {}
		public CafeDto(Integer seq, String title, String content, String regdate, String intere, Integer open,
				String image, String postcode, String address, String detailaddress, String extraaddress, Integer cnt,
				Integer tocnt) {
			super();
			this.seq = seq;
			this.title = title;
			this.content = content;
			this.regdate = regdate;
			this.intere = intere;
			this.open = open;
			this.image = image;
			this.postcode = postcode;
			this.address = address;
			this.detailaddress = detailaddress;
			this.extraaddress = extraaddress;
			this.cnt = cnt;
			this.tocnt = tocnt;
		}
		public Integer getSeq() {
			return seq;
		}
		public void setSeq(Integer seq) {
			this.seq = seq;
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
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public String getIntere() {
			return intere;
		}
		public void setIntere(String intere) {
			this.intere = intere;
		}
		public Integer getOpen() {
			return open;
		}
		public void setOpen(Integer open) {
			this.open = open;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getPostcode() {
			return postcode;
		}
		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getDetailaddress() {
			return detailaddress;
		}
		public void setDetailaddress(String detailaddress) {
			this.detailaddress = detailaddress;
		}
		public String getExtraaddress() {
			return extraaddress;
		}
		public void setExtraaddress(String extraaddress) {
			this.extraaddress = extraaddress;
		}
		public Integer getCnt() {
			return cnt;
		}
		public void setCnt(Integer cnt) {
			this.cnt = cnt;
		}
		public Integer getTocnt() {
			return tocnt;
		}
		public void setTocnt(Integer tocnt) {
			this.tocnt = tocnt;
		}
		@Override
		public String toString() {
			return "CafeDto [seq=" + seq + ", title=" + title + ", content=" + content + ", regdate=" + regdate
					+ ", intere=" + intere + ", open=" + open + ", image=" + image + ", postcode=" + postcode
					+ ", address=" + address + ", detailaddress=" + detailaddress + ", extraaddress=" + extraaddress
					+ ", cnt=" + cnt + ", tocnt=" + tocnt + "]";
		}
		
}
