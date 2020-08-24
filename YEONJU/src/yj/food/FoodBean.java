package yj.food;

public class FoodBean {
	private int pnum;
	private String pname;
	private String pkind_fk;
	private int pqty;
	private String pimage;
	private int price;
	private String pcontent;
	private String pspec;
	private int point;
	private int totalprice;
	private int saleprice;
	private int totalpoiny;
	
	public FoodBean() {
		
	}
	public FoodBean(int pnum, String pname, String pkind_fk, int pqty, String pimage, int price, String pcontent,
			String pspec, int point, int totalprice, int saleprice, int totalpoiny) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pkind_fk = pkind_fk;
		this.pqty = pqty;
		this.pimage = pimage;
		this.price = price;
		this.pcontent = pcontent;
		this.pspec = pspec;
		this.point = point;
		this.totalprice = totalprice;
		this.saleprice = saleprice;
		this.totalpoiny = totalpoiny;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPkind_fk() {
		return pkind_fk;
	}
	public void setPkind_fk(String pkind_fk) {
		this.pkind_fk = pkind_fk;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPspec() {
		return pspec;
	}
	public void setPspec(String pspec) {
		this.pspec = pspec;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getTotalpoiny() {
		return totalpoiny;
	}
	public void setTotalpoiny(int totalpoiny) {
		this.totalpoiny = totalpoiny;
	}
	
}
