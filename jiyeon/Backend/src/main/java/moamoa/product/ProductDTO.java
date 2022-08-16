package moamoa.product;
//DTO로 데이터 저장 및 사용 (get, set)
public class ProductDTO {
	private String mealkit_num;
	private String post_code;
	private String mealkit_title;
	private int mealkit_count;
	private int mealkit_price;
	private String mealkit_content;
	private String mealkit_sell_period;
	private String main_ingredient;
	private String addition_ingredient;
	private int view_count;
	private String mealkit_sort;
	
	public ProductDTO() {
		
	}
	
	public ProductDTO(String mealkit_num, int mealkit_price ) {
		super();
		this.mealkit_num = mealkit_num;
		this.mealkit_price = mealkit_price;
	}

	public ProductDTO(String mealkit_num, String post_code, String mealkit_title, int mealkit_count,
			int mealkit_price, String mealkit_content, String mealkit_sell_period, String main_ingredient,
			String addition_ingredient, int view_count, String mealkit_sort) {
		super();
		this.mealkit_num = mealkit_num;
		this.post_code = post_code;
		this.mealkit_title = mealkit_title;
		this.mealkit_count = mealkit_count;
		this.mealkit_price = mealkit_price;
		this.mealkit_content = mealkit_content;
		this.mealkit_sell_period = mealkit_sell_period;
		this.main_ingredient = main_ingredient;
		this.addition_ingredient = addition_ingredient;
		this.view_count = view_count;
		this.mealkit_sort = mealkit_sort;
	}

	public String getMealkit_num() {
		return mealkit_num;
	}

	public void setMealkit_num(String mealkit_num) {
		this.mealkit_num = mealkit_num;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getMealkit_title() {
		return mealkit_title;
	}

	public void setMealkit_title(String mealkit_title) {
		this.mealkit_title = mealkit_title;
	}

	public int getMealkit_count() {
		return mealkit_count;
	}

	public void setMealkit_count(int mealkit_count) {
		this.mealkit_count = mealkit_count;
	}

	public int getMealkit_price() {
		return mealkit_price;
	}

	public void setMealkit_price(int mealkit_price) {
		this.mealkit_price = mealkit_price;
	}

	public String getMealkit_content() {
		return mealkit_content;
	}

	public void setMealkit_content(String mealkit_content) {
		this.mealkit_content = mealkit_content;
	}

	public String getMealkit_sell_period() {
		return mealkit_sell_period;
	}

	public void setMealkit_sell_period(String mealkit_sell_period) {
		this.mealkit_sell_period = mealkit_sell_period;
	}

	public String getMain_ingredient() {
		return main_ingredient;
	}

	public void setMain_ingredient(String main_ingredient) {
		this.main_ingredient = main_ingredient;
	}

	public String getAddition_ingredient() {
		return addition_ingredient;
	}

	public void setAddition_ingredient(String addition_ingredient) {
		this.addition_ingredient = addition_ingredient;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getMealkit_sort() {
		return mealkit_sort;
	}

	public void setMealkit_sort(String mealkit_sort) {
		this.mealkit_sort = mealkit_sort;
	}
	
	
	
	
}
