package moamoa.signup;
//DTO: 값을 받아오는 작업, 중복 확인 or 휴대폰 인증 no.
public class SignupDTO {
	private String join_name;//ind_signup_step2.html 파일의 name="inflow_id"가져오기
	private String join_id;
	private String join_pw;
	private String join_pw1;
	private String join_cell1;
	private String join_cell2;
	private String join_cell3;
	private String join_email0;
	private String join_email1;
	private String inflow_id;
	
	///setter, getter
	
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getJoin_pw() {
		return join_pw;
	}
	public void setJoin_pw(String join_pw) {
		this.join_pw = join_pw;
	}
	public String getJoin_pw1() {
		return join_pw1;
	}
	public void setJoin_pw1(String join_pw1) {
		this.join_pw1 = join_pw1;
	}
	public String getJoin_cell1() {
		return join_cell1;
	}
	public void setJoin_cell1(String join_cell1) {
		this.join_cell1 = join_cell1;
	}
	public String getJoin_cell2() {
		return join_cell2;
	}
	public void setJoin_cell2(String join_cell2) {
		this.join_cell2 = join_cell2;
	}
	public String getJoin_cell3() {
		return join_cell3;
	}
	public void setJoin_cell3(String join_cell3) {
		this.join_cell3 = join_cell3;
	}
	public String getJoin_email0() {
		return join_email0;
	}
	public void setJoin_email0(String join_email0) {
		this.join_email0 = join_email0;
	}
	public String getJoin_email1() {
		return join_email1;
	}
	public void setJoin_email1(String join_email1) {
		this.join_email1 = join_email1;
	}
	public String getInflow_id() {
		return inflow_id;
	}
	public void setInflow_id(String inflow_id) {
		this.inflow_id = inflow_id;
	}	
}
