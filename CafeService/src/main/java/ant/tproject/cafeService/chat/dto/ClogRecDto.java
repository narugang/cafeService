package ant.tproject.cafeService.chat.dto;

public class ClogRecDto {
	private Integer clog;
	private Integer recmem;
	private String recda;
	
	public ClogRecDto() {}
	public ClogRecDto(Integer clog, Integer recmem, String recda) {
		super();
		this.clog = clog;
		this.recmem = recmem;
		this.recda = recda;
	}

	public Integer getClog() {
		return clog;
	}

	public void setClog(Integer clog) {
		this.clog = clog;
	}

	public Integer getRecmem() {
		return recmem;
	}

	public void setRecmem(Integer recmem) {
		this.recmem = recmem;
	}

	public String getRecda() {
		return recda;
	}

	public void setRecda(String recda) {
		this.recda = recda;
	}	
}
