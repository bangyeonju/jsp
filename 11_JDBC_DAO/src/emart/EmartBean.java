package emart;

public class EmartBean {
	private int no;
	private String id;
	private String pw;
	private String product;
	private String time;
	private String approve;
	private String agree;
	
	public EmartBean(int no, String id, String pw, String product, String time, String approve, String agree) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.product = product;
		this.time = time;
		this.approve = approve;
		this.agree = agree;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	
	
	

}
