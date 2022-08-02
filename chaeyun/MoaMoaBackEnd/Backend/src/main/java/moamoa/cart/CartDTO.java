package moamoa.cart;

public class CartDTO {
	private String cart_code;
	private String id;
	private String mealkit_num;
	private String mealkit_title;
	private int mealkit_count;
	private int mealkit_price;
	private String mem_sort;
	
	public CartDTO() {
		
	}
	
	public CartDTO(String cart_code, String id, String mealkit_num, String mealkit_title, int mealkit_count,
			int mealkit_price, String mem_sort) {
		super();
		this.cart_code = cart_code;
		this.id = id;
		this.mealkit_num = mealkit_num;
		this.mealkit_title = mealkit_title;
		this.mealkit_count = mealkit_count;
		this.mealkit_price = mealkit_price;
		this.mem_sort = mem_sort;
	}

	public String getCart_code() {
		return cart_code;
	}

	public void setCart_code(String cart_code) {
		this.cart_code = cart_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMealkit_num() {
		return mealkit_num;
	}

	public void setMealkit_num(String mealkit_num) {
		this.mealkit_num = mealkit_num;
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

	public String getMem_sort() {
		return mem_sort;
	}

	public void setMem_sort(String mem_sort) {
		this.mem_sort = mem_sort;
	}
	
	
}
