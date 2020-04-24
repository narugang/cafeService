package ant.tproject.cafeService.cafe;

public class CategoryDto {
	private Integer code;
	private String name;
	private Integer cafe;
	
	public CategoryDto() {}
	public CategoryDto(Integer code, String name, Integer cafe) {
		super();
		this.code = code;
		this.name = name;
		this.cafe = cafe;
	}
	public CategoryDto(String name, Integer cafe) {
		super();
		this.name = name;
		this.cafe = cafe;
	}
	public CategoryDto(Integer code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCafe() {
		return cafe;
	}

	public void setCafe(Integer cafe) {
		this.cafe = cafe;
	}
}
