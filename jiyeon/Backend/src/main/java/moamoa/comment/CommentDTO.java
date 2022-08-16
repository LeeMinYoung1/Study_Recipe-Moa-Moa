package moamoa.comment;
//DTO로 데이터 저장 및 사용 (get, set)
public class CommentDTO {
	private String post_comment;
	private String post_title;
	private String post_comment_writer;
	private String post_comment_wirte_date;
	private String post_comment_content;
	
	
	public CommentDTO() {
	}


	public CommentDTO(String post_comment, String post_title, String post_comment_writer,
			String post_comment_wirte_date, String post_comment_content) {
		super();
		this.post_comment = post_comment;
		this.post_title = post_title;
		this.post_comment_writer = post_comment_writer;
		this.post_comment_wirte_date = post_comment_wirte_date;
		this.post_comment_content = post_comment_content;
	}


	public String getPost_comment() {
		return post_comment;
	}


	public void setPost_comment(String post_comment) {
		this.post_comment = post_comment;
	}


	public String getPost_title() {
		return post_title;
	}


	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}


	public String getPost_comment_writer() {
		return post_comment_writer;
	}


	public void setPost_comment_writer(String post_comment_writer) {
		this.post_comment_writer = post_comment_writer;
	}


	public String getPost_comment_wirte_date() {
		return post_comment_wirte_date;
	}


	public void setPost_comment_wirte_date(String post_comment_wirte_date) {
		this.post_comment_wirte_date = post_comment_wirte_date;
	}


	public String getPost_comment_content() {
		return post_comment_content;
	}


	public void setPost_comment_content(String post_comment_content) {
		this.post_comment_content = post_comment_content;
	}
	
	
}
