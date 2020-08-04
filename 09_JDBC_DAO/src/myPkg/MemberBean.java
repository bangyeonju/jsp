package myPkg;

public class MemberBean {
	private int num;
	private String id;
	private String passwd;
	private String name;
	private String register;
	
	public MemberBean(int num, String id, String passwd, String name, String register) {
		super();
		this.num = num;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.register = register;
	}
	public MemberBean() {
		
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		System.out.println("setNum()");
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		System.out.println("setId()");
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		System.out.println("setPasswd");
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("setName");
		this.name = name;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		System.out.println("setRegister()");
		this.register = register;
	}
	
	
}
