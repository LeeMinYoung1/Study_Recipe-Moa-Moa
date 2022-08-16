package moamoa.contract;
//DTO로 데이터 저장 및 사용 (get, set)
public class ContractDTO {
	private String contract_code;
	private String id;
	private String mealkit_title;
	private String contract_day;
	private String contract_facts;
	private int milkit_registration_amount;
	private int contract_amount;
	
	public ContractDTO() {
		
	}

	public ContractDTO(String contract_code, String id, String mealkit_title, String contract_day,
			String contract_facts, int milkit_registration_amount, int contract_amount) {
		super();
		this.contract_code = contract_code;
		this.id = id;
		this.mealkit_title = mealkit_title;
		this.contract_day = contract_day;
		this.contract_facts = contract_facts;
		this.milkit_registration_amount = milkit_registration_amount;
		this.contract_amount = contract_amount;
	}

	public String getContract_code() {
		return contract_code;
	}

	public void setContract_code(String contract_code) {
		this.contract_code = contract_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMealkit_title() {
		return mealkit_title;
	}

	public void setMealkit_title(String mealkit_title) {
		this.mealkit_title = mealkit_title;
	}

	public String getContract_day() {
		return contract_day;
	}

	public void setContract_day(String contract_day) {
		this.contract_day = contract_day;
	}

	public String getContract_facts() {
		return contract_facts;
	}

	public void setContract_facts(String contract_facts) {
		this.contract_facts = contract_facts;
	}

	public int getMilkit_registration_amount() {
		return milkit_registration_amount;
	}

	public void setMilkit_registration_amount(int milkit_registration_amount) {
		this.milkit_registration_amount = milkit_registration_amount;
	}

	public int getContract_amount() {
		return contract_amount;
	}

	public void setContract_amount(int contract_amount) {
		this.contract_amount = contract_amount;
	}
	
	
}
