package myPkg;

public class EmpleBean {
	private int mid;
	private String name;
	private int did;
	private int salary;
	
	public EmpleBean() {
		super();
	}
	
	public EmpleBean(int mid, String name, int did, int salary) {
		super();
		this.mid = mid;
		this.name = name;
		this.did = did;
		this.salary = salary;
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
}
