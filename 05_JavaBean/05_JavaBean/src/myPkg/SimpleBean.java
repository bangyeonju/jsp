package myPkg;


public class SimpleBean {
	
	private String msg;

	public SimpleBean(String msg){
		System.out.println("SimpleBean(String msg)");
	}
	
	public SimpleBean(){
		System.out.println("SimpleBean()");
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
