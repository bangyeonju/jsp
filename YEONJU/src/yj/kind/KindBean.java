package yj.kind;

public class KindBean {
 private int fnum;
 private String fcode;
 private String fname;
 
public int getFnum() {
	return fnum;
}
public void setFnum(int fnum) {
	this.fnum = fnum;
}
public String getFcode() {
	return fcode;
}
public void setFcode(String fcode) {
	this.fcode = fcode;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}

public KindBean(int fnum, String fcode, String fname) {
	super();
	this.fnum = fnum;
	this.fcode = fcode;
	this.fname = fname;
}
public KindBean() {
}
 
 
}
