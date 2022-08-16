package moamoa.post;
//DTO로 데이터 저장 및 사용 (get, set)
public class PostDTO {
	private String post_code;
	private String title;
	private String id;
	private String ingredient;
	private String content;
	private String category;
	private String date;
	
	public PostDTO() { //���� ���� PostDTO class ����ϱ� ���� �޼ҵ� ������ ȣ��
	}
	public PostDTO(String code, String title, String id, String ingredient, String content, String category,
			String date) {
		super();
		this.post_code = code;
		this.title = title;
		this.id = id;
		this.ingredient = ingredient;
		this.content = content;
		this.category = category;
		this.date = date;
	}
	
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
